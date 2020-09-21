class ChatroomsController < ApplicationController
  
  def show
    @flat = Flat.find(params[:flat_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end
