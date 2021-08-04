class AddForeignKeyForInstructions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :instructions, :recipes
  end
end
