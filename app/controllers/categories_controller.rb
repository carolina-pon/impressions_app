class CategoriesController < ApplicationController
  before_action :require_admin
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save!
      redirect_to categories_path, notice: "カテゴリー名 #{@category.name} を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update!(category_params)
      redirect_to categories_path, notice: "カテゴリー名 #{@category.name} を更新しました。"
    else
      render:new
    end
  end

  def destroy
    @category.destroy!
    redirect_to categories_path, notice: "カテゴリー名 #{@category.name} を削除しました。"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
