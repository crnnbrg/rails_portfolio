class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project added successfully!'
      respond_to do |format|
        format.html { redirect_to brands_path(@project) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully!'
      redirect_to projects_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project delete successfull!'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :link, :skill, :picture)
  end
end
