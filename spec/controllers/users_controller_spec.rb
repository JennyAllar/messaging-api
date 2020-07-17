require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:user) {
       { :name => 'Jamie Buchman', :email => 'jamie@buchman.com' }
    }

    describe '#GET index' do
        it 'returns a successful response' do
            User.create!(user)
            get :index, params: {}
            expect(response).to be_successful
        end
    end 
end