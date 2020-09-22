class ChatroomsController < ApplicationController

  def index
    @flat = Flat.find(params[:flat_id])
    @chatrooms = Chatroom.where(flat_id: @flat.id)
    @message = Message.new
  end

  # def show
  #   @flat = Flat.find(params[:flat_id])
  #   @chatroom = Chatroom.find(params[:id])
  #   @message = Message.new
  # end




end


