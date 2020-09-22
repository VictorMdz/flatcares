class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:update]

  def update
    @event = @participation.event

    if @participation.update(participation_params)
      redirect_to flat_event_path(@event.flat, @event)
    else
      render flat_event_path(@event.flat, @event)
    end
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:participating)
  end
end
