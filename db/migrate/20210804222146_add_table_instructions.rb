class AddTableInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.column(:step, :integer)
      t.column(:direction, :string)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end
  end
end
