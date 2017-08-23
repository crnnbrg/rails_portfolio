class RecommendationsController < ApplicationController
  def index
    @recomendations = Recommendation.all
  end
end
