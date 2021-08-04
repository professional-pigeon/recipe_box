class InstructionsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.new(instruction_params)
    if @instruction.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @instructions = Instruction.find(params[:id])
    render :show
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = Instruction.find(params[:id])
    render :edit
  end

  def update
    @instruction = Instruction.find(params[:id])
    if @instruction.update(instruction_params)
      flash[:notice] = "Instruction successfully updated!"
      redirect_to recipe_path(@instruction.recipe)
    else
      @recipe = Recipe.find(params[:recipe_id])
      render :edit
    end
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    @instruction.destroy
    flash[:notice] = "Instruction successfully destroyed!"
    redirect_to recipe_path(@instruction.recipe)
  end

  private
    def instruction_params
      params.require(:instruction).permit(:step, :direction)
    end
end