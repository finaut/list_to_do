class List < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, length: {maximum: 255}
  before_save :capitalize_name

  def capitalize_name
    self.name.capitalize!
  end
end
