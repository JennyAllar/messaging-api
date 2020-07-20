require 'swagger_helper'

RSpec.describe 'api/users_controller', type: :request do
  path "/users" do
    post "Create a User" do
      tags "Users"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
        },
        required: ["name", "email"],
      }
response "201", "user created" do
        let(:user) { { name: 'Big Tuna', email: 'jim.halpert@dundermifflin.com' } }
        run_test!
      end
response "400", "invalid request" do
        let(:user) { { name: 'Andy' } }
        run_test!
      end
    end
  end
end
