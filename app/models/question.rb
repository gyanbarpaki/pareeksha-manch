class Question < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true

  def self.objectives
    where(type: 'ObjectiveQuestion')
  end
end
