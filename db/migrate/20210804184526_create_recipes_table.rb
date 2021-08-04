class CreateRecipesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)
      
      t.timestamps()
    end
  end
end
