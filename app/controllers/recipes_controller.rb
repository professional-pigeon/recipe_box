class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    # @recipes = @recipes.sort_by {|recipe, rating| rating <=> recipe}
    @recipes = @recipes.sort_by {|recipe| -recipe.rating}
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path      
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @instructions = @recipe.instructions
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :rating)
  end

end