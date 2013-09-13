class TicketsController < ApplicationController
  before_action :set_project
  def new
    @ticket = @project.tickets.build
    3.times { @ticket.assets.build }
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end

  end
  
  def show
    @ticket  = Ticket.find(params[:id])
    @comment = @ticket.comments.build
    @states = State.all
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  def search
    @tickets = @project.tickets.search("tag:#{params[:search]}")
    render "projects/show"
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end
  
  def ticket_params
    params.require(:ticket).permit(:title, :description, :tag_names, assets_attributes: [:asset])
  end

end
