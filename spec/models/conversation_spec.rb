require 'rails_helper'

RSpec.describe Conversation, :type => :model do
    describe '.between' do
      before do
        @sender = create(:user)
        @recipient = create(:user)
        @conversation = create(:conversation, sender: @sender, recipient: @recipient)
        @message = create(:message, content: "So lovely to see you!", conversation_id: @conversation.id, user: @conversation.recipient)
      end

      context 'it successfully find a conversation' do
        it 'finds a conversation between two users' do
          conversation = Conversation.between(@sender, @recipient)
          expect(conversation.count).to eq(1)
        end
      end
    end
end
