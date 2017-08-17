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
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully!'
    redirect_to projects_path
  end
end
