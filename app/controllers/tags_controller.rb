class TagsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new(tag_params)
    if @tag.save
      @recipe.tags << @tag
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def unjoin
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    @recipe.tags.delete(@tag)
    # @tag.recipes.delete(@recipe)
    redirect_to recipe_path(@recipe)
  end


  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully destroyed!"
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    render :show
  end

  private
    def tag_params
      params.require(:tag).permit(:category)
    end

end