class ConversationsController < ApplicationController
  def index
    @conversations = current_user.all_conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(conversation: @conversation)
    @message = Message.new
    @message.conversation = @conversation
    @message.sender = current_user
    @message.receiver = @conversation.messages.first.sender == current_user ?
      @conversation.messages.first.receiver :
      @conversation.messages.first.sender
  end

  def create
  end
end
