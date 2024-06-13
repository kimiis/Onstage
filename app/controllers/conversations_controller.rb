class ConversationsController < ApplicationController
  def index
    @conversations = current_user.all_conversations
  end

  def show
    @booking = Booking.new
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(conversation: @conversation)
    @message = Message.new
    @message.conversation = @conversation
    @message.sender = current_user
    if @conversation.messages.first.sender == current_user
      @conversation.messages.first.receiver
    else
      @conversation.messages.first.sender
    end
  end

  def create
    @stage_user = Stage.find(params[:stage_id]).user
    @conversation = Conversation.create(name: "")
    @messages = Message.create(content: "Bienvenue dans votre conversation. Merci de rester courtois.", sender: current_user, receiver: @stage_user, conversation: @conversation)
    redirect_to(conversation_path(@conversation))
  end
end
