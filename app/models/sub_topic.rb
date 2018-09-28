class SubTopic < ApplicationRecord
  belongs_to :topic, optional: true
  has_many :questions

  def self.default
    SubTopic.new(name: '', description: '')
  end
end
