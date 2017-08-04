class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new
  end
end
