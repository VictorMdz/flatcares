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

  def new
    @flat = Flat.find(params[:flat_id])
    @users = @flat.users
    @user = current_user
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


