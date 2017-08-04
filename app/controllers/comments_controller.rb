class CommentsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    if @comment.save
      redirect_to project_path(@comment.project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:review)
  end
end
