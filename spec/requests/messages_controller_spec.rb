require 'rails_helper'

RSpec.describe 'Get all messages in a conversation', type: :request do
  context 'a successful request' do
    before do
      user1 = create(:user)
      user2 = create(:user)
      @conversation = Conversation.new(recipient_id: user1.id, sender_id: user2.id)
      @conversation.save!

      @message = @conversation.messages.new(content: "So nice to see you!", user_id: user1.id)
      @message.save!
    end

    describe '#GET conversation messages' do
      it 'returns a successful response' do
        get "/conversations/#{@conversation.id}/messages", params: {}

        expect(response.body).to include("So nice to see you!")
        expect(response.status).to eq(200)
      end
    end
  end
end
