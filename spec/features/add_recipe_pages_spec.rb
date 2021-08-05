require 'rails_helper'

describe "the add recipe process" do
  it "add a new recipe" do
    visit recipes_path
    click_link 'Add a Recipe'
    fill_in 'Name', :with => 'Lemon Pepper Tofu'
    fill_in 'Rating', :with => 1
    click_on 'Create Recipe'
    expect(page).to have_content 'Lemon Pepper Tofu - Rating: 1'
  end

  it "gives an error when no name is entered" do
    visit new_recipe_path
    click_on 'Create Recipe'
    expect(page).to have_content "Name can't be blank"
  end
end