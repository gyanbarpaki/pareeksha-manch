class Subject < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :questions
end
