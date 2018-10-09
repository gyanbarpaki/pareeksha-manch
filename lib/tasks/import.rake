require 'roo'

DEFAULT_SHEET_NO = 0
QNS_COLS = {
  subject: 1, chapter: 2, topic: 3, sub_topic: 4,
  difficulty: 5, question: 6, solution: 12,
  option1: 7, option2: 8, option3: 9, option4: 10, correct_option: 11
}.freeze


namespace :import do
  desc "Import Questions from Excel Sheet"

  task questions: :environment do
    filename = File.join Rails.root, "samples/questions.xlsx"
    ws = Roo::Excelx.new(filename).sheet(DEFAULT_SHEET_NO)

    ws.each(headers: true, clean: true).drop(1).each do |row|
      sub_name = row['Subject']
      s = existing_subject(sub_name)
      s = create_subject(sub_name) if s.nil?

      chap_name = row['Chapter']
      c = existing_chapter(chap_name)
      c = create_chapter(chap_name) if c.nil?

      topic_name = row['Topic']
      t = existing_subject(topic_name)
      t = create_topic(topic_name) if t.nil?

      sub_topic_name = row['Sub Topic']
      st = existing_subject(sub_topic_name)
      st = create_sub_topic(sub_topic_name) if st.nil?

      opt1, opt2, opt3, opt4 = row['Option 1'], row['Option 2'], row['Option 3'], row['Option 4']
      correct_option, diff = row['Correct Option'], row['Difficulty']
      content, solution = row['Question'], row['Solution']

      qns = create_question(content, opt1, opt2, opt3, opt4, correct_option, diff, solution)
      qns.subject = s
      qns.chapter = c
      qns.topic = t
      qns.sub_topic = st
      qns.save

      puts "Question Info:"
      puts "Content: #{qns.content} Difficulty: #{qns.difficulty}, Solution: #{qns.solution}, Correct Option: #{qns.correct_option}"
      puts "First Option: #{qns.option1} Last Option: #{qns.option4}"

      puts "Subject: #{qns.subject.name}, Chapter: #{qns.chapter.name}, Topic: #{qns.topic.name}, Sub Topic: #{qns.sub_topic.name}"
    end
  end
end

def create_question(content, opt1, opt2, opt3, opt4, correct_opt, difficulty, ans)
  puts "Ans: #{ans}"
  Question.create!(
      content: content, option1: opt1, option2: opt2, option3: opt3, option4: opt4,
      solution: ans, difficulty: difficulty, correct_option: correct_opt, qns_type: 'Objective'
  )
end

def create_subject(name)
  Subject.create(name: name)
end

def create_chapter(name)
  Chapter.create(name: name)
end

def create_topic(name)
  Topic.create(name: name)
end

def create_sub_topic(name)
  SubTopic.create(name: name)
end

def existing_subject(name)
  Subject.find_by_name(name)
end

def existing_chapter(name)
  Chapter.find_by_name(name)
end

def existing_topic(name)
  Topic.find_by_name(name)
end

def existing_sub_topic(name)
  SubTopic.find_by_name(name)
end
