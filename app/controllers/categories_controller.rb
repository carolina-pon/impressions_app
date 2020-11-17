class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save

  end

  private
  def category_params
      params.require(:category).permit(:name)
  end

  # def set_category
  #   @category = Category.find(params[:id])
  # end
end
