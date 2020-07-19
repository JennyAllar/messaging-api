class ConversationsController < ApplicationController
  # def index
  #   @conversations = Conversation.all
  #   render json: { conversations: @conversations }, status: 200
  # end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
      render json: { chat: @conversation }, status: 201
    end
  end

  def show
    conversation = Conversation.find(params[:id])
    if conversation
      render json: {conversation: conversation}, status: 200
    end
  end


  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
