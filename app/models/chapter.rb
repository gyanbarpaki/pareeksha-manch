class Chapter < ApplicationRecord
  belongs_to :subject
  validates :subject, presence: true
  has_many :topics, dependent: :destroy
end
