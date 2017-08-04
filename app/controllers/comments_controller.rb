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

  private

  def comment_params
    params.require(:comment).permit(:review)
  end
end
