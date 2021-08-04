class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true

  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end