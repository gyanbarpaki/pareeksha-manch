class ObjectiveQuestion < Question
  attribute :correct_option, Option

  has_many :options
  accepts_nested_attributes_for :options, allow_destroy: true
end
