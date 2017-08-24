class RecommendationsController < ApplicationController
  def index
    @recomendations = Recommendation.all
    render :index
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    render :show
  end

  def new
    @recommendation = Recommendation.new
    render :new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save
      redirect_to recommendations_path
    else
      render :new
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:name, :job_description, :email, :phone)
  end
end
