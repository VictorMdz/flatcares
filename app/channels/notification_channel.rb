class NotificationChannel < ApplicationCable::Channel
  def subscribed
    flat = Flat.find(params[:id])
    stream_for flat
  end
end
