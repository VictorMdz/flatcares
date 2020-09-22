class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    # @flat = @chatroom.flat
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
