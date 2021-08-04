class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = Ingredient.find(params[:id])
    render :show
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Ingredient successfully updated!"
      redirect_to recipe_path(@ingredient.recipe)
    else
      @recipe = Recipe.find(params[:recipe_id])
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    flash[:notice] = "Ingredient successfully destroyed!"
    redirect_to recipe_path(@ingredient.recipe)
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:amount, :item)
    end
end