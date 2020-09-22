class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @flat = @chatroom.flat
    @message = Message.new(message_params)
    @message.chatroom_id = @chatroom.id
    @message.user = current_user

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
    else
      render "chatrooms/index"
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end

end
