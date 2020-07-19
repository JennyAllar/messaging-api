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
          expect(response).to_not be_successful
          expect(response.body).to include("Sorry! Can't find that!")
      end
    end
  end
end
