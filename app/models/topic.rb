class Topic < ApplicationRecord
  belongs_to :chapter
  has_many :sub_topics, dependent: :destroy
  has_many :questions
end
