class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_and_belongs_to_many(:tags)
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  scope :tops, -> { where("rating > 3") }
  scope :food, ->(pass) { where("lower(name) LIKE ?", "%" + pass.downcase + "%") }
  
  # def self.food(pass)
  #   where("lower(name) LIKE ?", "%" + pass.downcase + "%")
  # end


  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end