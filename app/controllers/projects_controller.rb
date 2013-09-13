class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project

    end

  end
  
  def show
    @project = Project.find(params[:id])
    @tickets = @project.tickets
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name,:description)
  end

end
