class EventsController < ApplicationController
before_action  :logged_in?, only: :new 

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to event_path(@event)
    else
      flash.now[:danger] = "Event creation unsuccessful"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  private
    def event_params
      params.require(:event).permit(:name, :date)
    end

    def logged_in?
      redirect_to login_path unless current_user
    end
end
