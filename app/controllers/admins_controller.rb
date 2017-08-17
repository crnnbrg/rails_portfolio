class AdminsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project delete successfull!'
    redirect_to projects_path(@project)
  end
end
