class CommentsController < ApplicationController
  # before_filter :authorize, only: %i[edit update]
  def new
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment added successfully!'
      redirect_to project_path(@comment.project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated successfully!'
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully!'
    redirect_to projects_path
  end

  private

  def comment_params
    params.require(:comment).permit(:review)
  end
end
