class Subject < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :questions

  def self.default
    Subject.new(name: '', description: '')
  end
end
