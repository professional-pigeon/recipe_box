# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.destroy_all


10.times do |index|
  int = 1
  recipe = Recipe.create!(name: Faker::JapaneseMedia::DragonBall.character,
                        rating: Faker::Number.between(from: 1, to: 5))
  10.times do |inst|
    Instruction.create!(direction: Faker::Movie.title,
                        step: int,
                        recipe_id: recipe.id)
    Ingredient.create!(item: Faker::Food.ingredient,
                        amount: 1,
                        recipe_id: recipe.id)
    tag = Tag.create!(category: Faker::FunnyName.name)
                    recipe.tags << tag
    int += 1
  end
end

p "Created #{Recipe.count} recipes"