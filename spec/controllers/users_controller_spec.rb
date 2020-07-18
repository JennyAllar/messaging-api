require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'a successful request' do
        before do
            @user = create(:user)
        end

        describe '#GET index' do
            it 'returns a successful response' do
                get :index, params: {}
                expect(response).to be_successful
            end

            it 'displays the total user count and users' do
                get :index, params: {}
                resp = JSON.parse(response.body)
                expect(resp.keys).to eq(["total", "users"])
            end
        end
    end
end