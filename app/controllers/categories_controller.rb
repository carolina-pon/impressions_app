class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @user = User.find
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "カテゴリー名 #{@category.name} を登録しました！"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to categories_path, notice: "カテゴリー名 #{category.name} を更新しました！"
    else
      render:new
    end
  end

  def destroy
    category =  Category.find(params[:id])
    category.destroy
    redirect_to categories_path, notice: "カテゴリー名 #{category.name} を削除しました。"
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
