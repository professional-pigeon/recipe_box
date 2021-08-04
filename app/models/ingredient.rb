class Ingredient < ApplicationRecord
  belongs_to :recipes
  validates :item, presence: true
  validates :amount, presence: true
end