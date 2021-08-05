class TagsController < ApplicationController

  def new
  @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new(tag_params)
    if @tag.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:category)
    end

end