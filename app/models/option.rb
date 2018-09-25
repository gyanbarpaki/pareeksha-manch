class Option
  include ActiveModel::Model

  attribute :no, Integer
  attribute :content, :string

  validates :no, presence: true
  validates :content, presence: true
end
