require 'rails_helper'

RSpec.describe 'Get all conversations route', type: :request do
  context 'a successful request' do
    before do
      @sender = create(:user)
      @recipient = create(:user)
      @conversation = create(:conversation, sender: @sender, recipient: @recipient)
    end

    describe '#GET conversations' do
      it 'returns a successful response' do
        get '/conversations', params: {}
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'returns the conversations' do
        get '/conversations', params: {}
        resp = JSON.parse(response.body)
        expect(resp.keys).to eq(["conversations"])
      end
    end
  end
end

RSpec.describe 'Conversation creation route', type: :request do
  context 'a successful request' do
    before do
      @sender = create(:user)
      @recipient = create(:user)
      @conversation = create(:conversation, sender: @sender, recipient: @recipient)
    end
    describe '#POST conversations' do
      it 'returns a successful response' do
        post '/conversations', params: { sender_id: @sender.id, recipient_id: @recipient.id }
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(JSON.parse(response.body)["conversation"]).to include("created_at")
      end
    end
  end
  context 'an unsuccessful request' do
    describe '#POST conversations' do
      it 'returns an error message when a value is missing' do
        post '/conversations', params: { sender_id: nil, recipient_id: nil }
        expect(response).to_not be_successful
        expect(JSON.parse(response.body)["message"]).to include("Sender must exist")
        expect(JSON.parse(response.body)["message"]).to include("Recipient must exist")
        expect(response.status).to eq(400)
      end
    end
  end
end

RSpec.describe 'Conversation show route' do
  context 'a conversation can be found' do
    before do
      @sender = create(:user)
      @recipient = create(:user)
      @conversation = create(:conversation, sender: @sender, recipient: @recipient)
      @message = create(:message, conversation_id: @conversation.id, user_id: @sender.id)
    end

    it 'returns a conversation record' do
      get "/conversations/#{@conversation.id}", params: {}
      expect(response).to be_successful
      expect(response.body).to include("conversation")
      expect(response.status).to eq(200)
    end
  end

  context 'a conversation cannot be found' do
    it 'returns an error message' do
      get "/conversations/99999", params: {}
      expect(response.body).to include('That record could not be found.')
      expect(response.status).to eq(404)
    end
  end
end
