class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    @total_messages = @messages.length
  end

  def index
    @messages = @conversation.messages.where('created_at >= ?', 1.month.ago)
    if @total_messages > 100
      @messages = @messages.where('created_at >= ?', 1.month.ago)[-100..-1]
    end

    render json: { total: @total_messages, messages: @messages }, status: 200
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      @total_messages += 1
      render json: { total: @total_messages, messages: @messages }, status: 201
    end
  end

  private

  def message_params
    params.permit(:content, :user_id, :conversation_id)
  end
end
