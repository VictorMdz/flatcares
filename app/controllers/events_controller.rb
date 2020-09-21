class EventsController < ApplicationController

  def index
    @flat = Flat.find(params[:flat_id])
    @events = Event.where(flat_id: params[:flat_id])
  end
end
