class Question < ApplicationRecord
  attribute :difficulty, :string, default: "Medium"
  attribute :content, :string
  attribute :solution, :string

  belongs_to :subject, class_name: 'Subject', foreign_key: 'subject_id'
  belongs_to :chapter, class_name: 'Chapter', foreign_key: 'chapter_id'
  belongs_to :topic, class_name: 'Topic', foreign_key: 'topic_id'
  belongs_to :sub_topic, class_name: 'SubTopic', foreign_key: 'sub_topic_id'

  self.inheritance_column = :_type_disabled

  validates :name, presence: true

  def self.objectives
    where(type: 'ObjectiveQuestion')
  end
end
