class ImpressionsController < ApplicationController
  def index
    @impressions = Impression.limit(4).order("id DESC")
  end

  def show
    @impression = Impression.find(params[:id])
  end

  def new
    @impression = Impression.new
  end

  def create
    @impression = Impression.new(impression_params.merge(user_id: current_user.id))

    if @impression.save
    redirect_to @impression, notice: "#{@impression.title} の感想を登録しました！"
    else
      render :new
    end
  end

  def edit
    @impressions = current_user.Impressions.find(params[:id])
  end

  def update
    @impression = current_user.Impressions.find(params[:id])
    impression.update(impression_params)
    redirect_to impressions_url, notice: "#{impression.title}の感想を更新しました！"
  end

  def destroy
    impression = current_user.Impressions.find(params[:id])
    impression.destroy
    redirect_to impressions_url, notice: "#{impression.title}の感想を削除しました。"
  end

  private
  
  def impression_params
    params.require(:impression).permit(:title, :description, :user_id, :category_id)
  end
end
