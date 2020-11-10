class ImpressionsController < ApplicationController
  def index
    @impressions = Impression.limit(4).order("id DESC")
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @impression = Impression.new
  end

  def create
    impression = Impression.new(impression_params)
    impression.save!
    redirect_to impressions_url, notice: "#{impression.title} の感想を登録しました！"
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  private
  
  def impression_params
    params.require(:impression).permit(:title, :description)
  end
end
