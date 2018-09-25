class SubTopic < ApplicationRecord
  belongs_to :topic, optional: true
  has_many :questions
end
