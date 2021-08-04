class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :item, presence: true
  validates :amount, presence: true

  before_save(:titleize_ingredient)

  private
    def titleize_ingredient
      self.item = self.item.titleize
    end
end