class ImpressionsController < ApplicationController

    before_action :set_impression, only: [:edit, :update, :destroy]

  def index
    @impressions = Impression.limit(12).order("id DESC")
  end

  def show
    @impression = Impression.find(params[:id])
    @categories = Category.all
  end

  def new
    @impression = Impression.new
    @categories = Category.all
  end

  def create
    @impression = Impression.new(impression_params.merge(user_id: current_user.id))

    if @impression.save!
      redirect_to @impression, notice: "#{@impression.title} の感想を登録しました！"
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @impression.update!(impression_params)
      redirect_to impressions_url, notice: "#{@impression.title}の感想を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @impression.destroy!
    redirect_to impressions_url, notice: "#{@impression.title}の感想を削除しました。"
  end

  private

  def set_impression
    @impression = current_user.impressions.find(params[:id])
  end
  
  def impression_params
    params.require(:impression).permit(:title, :description, :user_id, :category_id)
  end
end
