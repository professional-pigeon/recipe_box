class AddTableIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.column(:amount, :string)
      t.column(:item, :string)
      t.column(:recipe_id, :integer)


      t.timestamps()
    end
  end
end
