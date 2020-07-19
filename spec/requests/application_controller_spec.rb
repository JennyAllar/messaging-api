require 'rails_helper'

RSpec.describe 'routing errors', type: :request do
  context 'a successful request' do
    describe '#GET users' do
      it 'returns a successful response' do
        get '/users', params: {}
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
    end
  end

  context 'a request to a path that does not exist' do
    describe '#GET chatters' do
      it 'returns an error' do
        get '/chatters', params: {}
        expect(response.body).to include("Whoops! That path doesn't exist.")
        expect(response.status).to eq(404)
      end
    end
  end

  context 'a request for a resource that does not exist' do
    describe '#GET user' do
      it 'returns an error' do
        get '/users/not_a_real_user', params: {}
        expect(response.body).to include("That record could not be found.")
        expect(response.status).to eq(404)
      end
    end
  end
end
