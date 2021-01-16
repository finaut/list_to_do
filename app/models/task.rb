class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true, length: { maximum: 255}
  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize!
  end
end
