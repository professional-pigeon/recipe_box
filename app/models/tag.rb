class Tag < ApplicationRecord
  validates :category, presence: true
  has_and_belongs_to_many(:recipes)

  before_save(:capitalize_tag)

  private
    def capitalize_tag
      self.category = self.category.capitalize
    end
end