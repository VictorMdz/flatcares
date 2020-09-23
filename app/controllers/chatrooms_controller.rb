class ChatroomsController < ApplicationController

  def index
    @flat = Flat.find(params[:flat_id])
    @chatrooms = Chatroom.where(flat_id: @flat.id)
    @message = Message.new

    @notification = current_user.notifications.find_by(notifiable_id: params[:message_id], notifiable_type: "Message")

    if @notification
      @notification.update opened_at: Date.today
    end
  end

  # def show
  #   @flat = Flat.find(params[:flat_id])
  #   @chatroom = Chatroom.find(params[:id])
  #   @message = Message.new
  # end




end


