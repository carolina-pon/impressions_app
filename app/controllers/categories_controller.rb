class CategoriesController < ApplicationController
  def create
    @category = Category.create(category_params)
  end
end
