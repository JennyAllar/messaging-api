require 'rails_helper'

RSpec.describe Message, :type => :model do
    describe 'validations' do
       it { should validate_presence_of(:user_id) }
       it { should validate_presence_of(:conversation_id) }
    end
end
