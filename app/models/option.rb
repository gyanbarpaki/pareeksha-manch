class Option
  include ActiveModel::Model

  attr_accessor :no, :Integer
  attr_accessor :content, :string

  validates :no, presence: true
  validates :content, presence: true
end
