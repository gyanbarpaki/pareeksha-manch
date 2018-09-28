class Topic < ApplicationRecord
  belongs_to :chapter, optional: true
  has_many :sub_topics, dependent: :destroy
  has_many :questions

  def self.default
    Topic.new(name: '', description: '')
  end
end
