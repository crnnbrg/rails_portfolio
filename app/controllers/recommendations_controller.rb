class RecommendationsController < ApplicationController
  def index
    @recomendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end
end
