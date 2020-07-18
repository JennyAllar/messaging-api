class User < ApplicationRecord
    has_and_belongs_to_many :conversations
    validates_uniqueness_of :email
end
