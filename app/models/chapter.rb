class Chapter < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :topics, dependent: :destroy
  has_many :questions

  def self.default
    Chapter.new(name: '', description: '')
  end
end
