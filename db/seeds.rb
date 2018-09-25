# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..2).each do |s|
  s = Subject.create(name: "Subj #{s}")

  (1..2).each do |c|
    c = Chapter.create(name: "#{s.name} Chap #{c}")

    (1..2).each do |t|
      t = Topic.create(name: "#{s.name} #{c.name} Topic #{t}")

      (1..2).each do |st|
        SubTopic.create(name: "#{s.name} #{c.name} #{t.name} Subtopic #{st}")
      end
    end
  end
end
