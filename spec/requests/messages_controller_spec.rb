require 'rails_helper'

RSpec.describe 'Get all messages in a conversation', type: :request do
  context 'a successful request' do
    before do
      @sender = create(:user)
      @recipient = create(:user)
      @conversation = create(:conversation, sender: @sender, recipient: @recipient)
      @message = create(:message, content: "So lovely to see you!", conversation_id: @conversation.id, user: @conversation.recipient)
    end

    describe '#GET conversation messages' do
      it 'returns a successful response' do
        get "/conversations/#{@conversation.id}/messages", params: {}

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["messages"].first["content"]).to eq("So lovely to see you!")
        expect(JSON.parse(response.body)["messages"].first["user_id"]).to eq(@recipient.id)
      end
    end

    describe '#GET conversation messages' do
      it 'returns exactly 100 messages if there are 100 or more' do
        103.times do |i|
          create(
            :message,
            content: "So nice to see you, #{i}",
            conversation_id: @conversation.id,
            user: @conversation.recipient
          )
        end

        get "/conversations/#{@conversation.id}/messages", params: {}

        expect(response).to be_successful
        expect(JSON.parse(response.body)["total"]).to eq(104)
        expect(JSON.parse(response.body)["messages"].count).to eq(100)
      end

      it 'returns only returns messages from the last thirty days' do
        2.times do |i|
          create(
            :message,
            content: "So nice to see you, #{i}",
            conversation_id: @conversation.id,
            user: @conversation.recipient
          )
        end

        Message.last.update(created_at: "2019-07-20T04:05:38.120Z")

        get "/conversations/#{@conversation.id}/messages", params: {}

        expect(response).to be_successful
        expect(JSON.parse(response.body)["total"]).to eq(3)
        expect(JSON.parse(response.body)["messages"].count).to eq(2)
      end
    end
  end
end
RSpec.describe 'Get all messages in a conversation', type: :request do
  context 'a successful request' do
    before do
      @sender = create(:user)
      @recipient = create(:user)
      @conversation = create(:conversation, sender: @sender, recipient: @recipient)
      @message = create(:message, content: "So lovely to see you!", conversation_id: @conversation.id, user: @conversation.recipient)
    end

    describe '#POST message' do
      it 'saves the message and returns the conversation' do

        post "/conversations/#{@conversation.id}/messages", params: { content: 'oh hi', user_id: @recipient.id }

        expect(response).to be_successful
        expect(JSON.parse(response.body)["messages"].first["user_id"]).to eq(@recipient.id)
        expect(JSON.parse(response.body)["messages"].count).to eq(2)
        expect(JSON.parse(response.body)["total"]).to eq(2)

        post "/conversations/#{@conversation.id}/messages", params: { content: 'what is happening?!', user_id: @sender.id }
        expect(JSON.parse(response.body)["messages"].count).to eq(3)
        expect(JSON.parse(response.body)["total"]).to eq(3)
      end
    end
  end
end
