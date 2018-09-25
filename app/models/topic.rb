class Topic < ApplicationRecord
  belongs_to :chapter, optional: true
  has_many :sub_topics, dependent: :destroy
  has_many :questions
end
