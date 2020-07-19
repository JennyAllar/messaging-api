class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    if @messages.length > 100
      @over_100 = true
      @messages = @messages[-100..-1]
    end

    render json: @messages, status: 200
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    binding.pry
    @message = @conversation.messages.new(message_params)
    if @message.save
      render json: { message: @conversation }, status: 201
    end
  end

  private

  def message_params
    params.permit(:content, :user_id, :conversation_id)
  end
end
