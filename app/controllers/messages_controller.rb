class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.sender = current_user
    if @conversation.messages.first.sender == current_user
      @message.receiver = @conversation.messages.first.receiver
    else
      @message.receiver = @conversation.messages.first.sender
    end
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        message: @message.content,
        sender_id: @message.sender.id
      )
      head :ok
    else
      # redirect_to(conversation_path(@conversation)) if @message.save
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
