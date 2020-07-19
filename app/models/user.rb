class User < ApplicationRecord
    has_many :messages
    has_many :conversations, foreign_key: :sender_id

    validates_uniqueness_of :email
    validates_presence_of :email
end
