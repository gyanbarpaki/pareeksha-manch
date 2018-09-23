class Subject < ApplicationRecord
  has_many :chapters, dependent: :destroy
end
