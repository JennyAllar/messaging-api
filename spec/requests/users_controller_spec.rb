require 'rails_helper'

RSpec.describe 'Get all users route', type: :request do
  context 'a successful request' do
    before do
      @user = create(:user)
    end

    describe '#GET users' do
      it 'returns a successful response' do
        get '/users', params: {}
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'displays the total user count and users' do
        get '/users', params: {}
        resp = JSON.parse(response.body)
        expect(resp.keys).to eq(["total", "users"])
      end
    end
  end
end

RSpec.describe 'User creation route', type: :request do
  context 'a successful request' do
    describe '#POST user' do
      it 'returns a successful response' do
        post '/users', params: {name: 'Jim Halpert', email: 'bigtuna@dundermifflin.com' }
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(JSON.parse(response.body)["user"]["name"]).to eq('Jim Halpert')
      end
    end
  end
  context 'an unsuccessful request' do
    describe '#POST user' do
      it 'returns an error message when a value is missing' do
        post '/users', params: { user: {name: 'Andy', email: nil }}
        expect(response).to_not be_successful
        expect(response.body).to include("Email can't be blank")
        expect(response.status).to eq(400)
      end

      it 'returns an error message when the email is not uniqe' do
        create(:user, email: 'bigtuna@dundermifflin.com')
        post '/users', params: { name: 'Andy', email: 'bigtuna@dundermifflin.com' }
        expect(response).to_not be_successful
        expect(response.body).to include("Email has already been taken")
        expect(response.status).to eq(400)
      end
    end
  end
end

RSpec.describe 'User show route' do
  context 'a user can be found' do
    it 'returns a user record' do
      user = create(:user)
      get "/users/#{user.id}", params: {}
      expect(response).to be_successful
      expect(response.body).to include(user.email)
      expect(response.status).to eq(200)
    end
  end

  context 'a user cannot be found' do
    it 'returns a message' do
      get "/users/99999", params: {}
      expect(response.body).to include('That record could not be found.')
      expect(response.status).to eq(404)
    end
  end
end

RSpec.describe 'User messages route' do
  context 'a user can be found' do
    it 'returns a user record' do
      sender = create(:user)
      recipient = create(:user)
      conversation = create(:conversation, sender: sender, recipient: recipient)
      message = create(:message, content: "So lovely to see you!", conversation_id: conversation.id, user: conversation.recipient)

      get "/users/#{recipient.id}/messages", params: {}

      expect(response).to be_successful
      expect(response.body).to include("So lovely to see you!")
      expect(response.status).to eq(200)
    end
  end
end
