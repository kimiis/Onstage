class ConversationsController < ApplicationController
  def index
    @conversations = current_user.all_conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(conversation: @conversation)
  end

  def create
  end
end
