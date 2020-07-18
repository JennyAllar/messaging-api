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
            end

            it 'displays the total user count and users' do
                get '/users', params: {}
                resp = JSON.parse(response.body)
                expect(resp.keys).to eq(["total", "users"])
            end
        end
    end
end
