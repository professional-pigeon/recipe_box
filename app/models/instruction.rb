class Instruction < ApplicationRecord
  belongs_to :recipe
  validates :step, presence: true
  validates :direction, presence: true

  before_save(:capitalize_instruction)

  private
    def capitalize_instruction
      self.item = self.item.capitalize
    end
end