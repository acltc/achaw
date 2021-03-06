class ProjectsController < ApplicationController
  before_action :authenticate_admin!, :except => [:show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to @project, notice: "New Project Created!"
      else
        render 'new'
      end
  end

  def update
    @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to @project, notice: "Project Updated!"
      else
        render 'edit'
      end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, alert: "Project Destroyed!"
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :portfolio_image, :image_one, :image_two, :image_three)
    end
end
