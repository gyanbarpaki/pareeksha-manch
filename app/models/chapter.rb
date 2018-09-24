class Chapter < ApplicationRecord
  belongs_to :subject
  has_many :topics, dependent: :destroy
  has_many :questions
end
