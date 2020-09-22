class ChatroomsController < ApplicationController
  
  def index
    @flat = Flat.find(params[:flat_id])
    @chatrooms = Chatroom.where(flat_id: params[:flat_id])
  end

  def show
    @flat = Flat.find(params[:flat_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @chatroom = Chatroom.new
  end 

  def create 
    @chatroom  = Chatroom.new(chatroom_params)
    @flat = Flat.find(params[:flat_id])
    @chatroom.flat_id = @flat.id

    if @chatroom.save
      redirect_to flat_chatroom_path(@flat, @chatroom)
    else
      render "chatrooms/new"
    end
  end

  private 

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end


end


