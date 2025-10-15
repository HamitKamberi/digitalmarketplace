class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_event_access, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]
  skip_authorization_check
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: "Event created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Event updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully!"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end

  def authorize_event_access
    unless current_user.organization? || current_user.role == "stakeholder"
      redirect_to root_path, alert: "You are not authorized to manage events."
    end
  end
end
