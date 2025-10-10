class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_event_access, only: [:new, :create]
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
      redirect_to root_path, notice: "Event created successfully!"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end

  def authorize_event_access
    unless current_user.organization? || current_user.role == "stakeholder"
      redirect_to root_path, alert: "You are not authorized to create events."
    end
  end
end
