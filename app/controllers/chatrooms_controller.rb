class ChatroomsController < ApplicationController

  def index
    # @flat = Flat.find(params[:flat_id])
    @flat = policy_scope(Flat).find(params[:flat_id])
    @chatrooms = Chatroom.where(flat_id: @flat.id)
    @message = Message.new

    @notifications = current_user.notifications.where(notifiable_type: "Message")

    @notifications.each do |notification|
      if notification
        notification.update opened_at: Date.today
      end
    end
  end

  # def show
  #   @flat = Flat.find(params[:flat_id])
  #   @chatroom = Chatroom.find(params[:id])
  #   @message = Message.new
  # end




end


