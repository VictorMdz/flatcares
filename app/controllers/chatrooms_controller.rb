class ChatroomsController < ApplicationController
  def index
    @flat = Flat.find(params[:flat_id])
    @chatrooms = Chatroom.all

  end

  def show
    @flat = Flat.find(params[:flat_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end


