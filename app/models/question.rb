class Question < ApplicationRecord
  attribute :difficulty, :string, default: 'Medium'
  attribute :content, :string
  attribute :solution, :string
  attribute :qns_type, :string
  attribute :correct_option, :string

  attribute :option1, :string
  attribute :option2, :string
  attribute :option3, :string
  attribute :option4, :string

  belongs_to :subject, class_name: 'Subject', foreign_key: 'subject_id', optional: true
  belongs_to :chapter, class_name: 'Chapter', foreign_key: 'chapter_id', optional: true
  belongs_to :topic, class_name: 'Topic', foreign_key: 'topic_id', optional: true
  belongs_to :sub_topic, class_name: 'SubTopic', foreign_key: 'sub_topic_id', optional: true

  self.inheritance_column = :_type_disabled

  validates :content, presence: true
  validates :qns_type, presence: true
  validates :solution, presence: true
  validates :difficulty, presence: true

  def self.objectives
    where(qns_type: 'Objective')
  end

  def self.options
    [
        self.option1, self.option2, self.option3. self.option4
    ]
  end

  before_create do |qns|
    qns.subject = Subject.default if qns.subject.nil?
    qns.chapter = Chapter.default if qns.chapter.nil?
    qns.topic = Topic.default if qns.topic.nil?
    qns.sub_topic = SubTopic.default if qns.sub_topic.nil?
  end
end
