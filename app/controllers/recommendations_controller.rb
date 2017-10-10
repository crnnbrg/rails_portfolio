class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save
      flash[:notice] = 'Recommendation created successfully!'
      redirect_to recommendations_path
    else
      render :new
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
    render :edit
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      flash[:notice] = 'Recommendation updated successfully!'
      redirect_to recommendations_path(@recommendation)
    else
      render :edit
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    flash[:notice] = 'Recommendation destroyed successfully!'
    redirect_to recommendations_path
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:name, :job_description, :email, :phone, :url, :picture)
  end
end
