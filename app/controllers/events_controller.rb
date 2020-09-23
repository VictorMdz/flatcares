class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :update, :edit]

  def index
    @flat = Flat.find(params[:flat_id])
    @events = Event.where(flat_id: params[:flat_id])
    @formatted_events = Event.format_json @events
  end

  def show
    @flat = Flat.find(params[:flat_id])
    @event_participations =  @event.participations
    @current_user_participation = @event_participations.where(user_id: current_user).first

    @notification = current_user.notifications.find_by(notifiable_id: params[:id], notifiable_type: "Event")

    if @notification
      @notification.update opened_at: Date.today
    end
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @users = @flat.users
    @user = current_user
    @event = Event.new
    @participation = Participation.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    @flat = Flat.find(params[:flat_id])
    @event.flat_id = @flat.id

    if @event.save
      redirect_to flat_events_path(@flat)
    else
      redirect_to flat_events_path(@flat)
    end
  end

  def edit
    @flat = Flat.find(params[:flat_id])
  end

  def update
    @flat = Flat.find(params[:flat_id])
    if @event.update(event_params)
      redirect_to flat_event_path(@flat, @event)
    else
      redirect_to flat_events_path(@flat)
    end
  end

  def destroy
    @flat = Flat.find(params[:flat_id])
    @event.destroy
    redirect_to flat_events_path(@flat)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time, :event_type, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
