# Guild Education - API Challenge
![Coverage](https://github.com/JennyAllar/messaging-api/blob/master/badge.svg)

## Using the Application Locally
`$ git clone git@github.com:JennyAllar/messaging-api.git`

`$ cd messaging-api`

`$ rake db:setup`

`$ bundle install`

`$ rails s`
And you're off to the races!

## Documentation
I chose to use the OpenAPI Specification (formerly Swagger specification) to document the three endpoints we'll use: Users, Conversations, and Messages
[Messaging-API Documentation](https://guild-api.herokuapp.com/api-docs/index.html)


## Deployment
The messaging-api has been deployed to Heroku here:
[Messaging-API](https://guild-api.herokuapp.com)

## Testing
I used Rspec with FactoryBot for testing. Based on the maximum 100 messages requirement, I briefly experimented with the Faker gem to create multiple random records. After some tooling around and research, I found that my Faker records were flakey and not reliable.


## Next Steps
I wanted to add a lot of fun and character to this API, but I found myself more concerned with building out a robust and well-tested application. This was **a ton** of fun and I plan to continue working on it.

My next steps include (in no particular order):
- allowing more than two users in a conversation
- authorization and authentication
- defining relationships between users (ex: "friendships")
- a "best chatter" leaderboard that aggregates all conversations to determine most active user
- deploy to EC2 instance with load balancer


---
## Initial Brainstorming before Starting the Project

## Requirements
- Global API with no security parameters
- Allows two users to send messages to each other (see: Facebook Messages & Google Chat)
- Recent messages should be available **for a recipient**  (limitations: 100 messages || all messages in last 30 days)
- Recent messages should be available **from all senders**(limitations: 100 messages || all messages in last 30 days)


## Steps
1. Understand requirements
2. Determine tools (Rails, RSpec, Swagger... which others?)
3. Write tests for expected endpoints and payloads (models: User, Message, Conversation)
4. Implement logic
5. Add some pizazz and personality
6. More tests
7. Deploy
8. Write instructions, notes, and related documentation to support using the API

## Random Thoughts
- Pagination may be useful for those 100+ messages
- Requirements state chat between 1:1. Consideration: don't tie messages to a receiver- this could leave things open for unlimited users in a chat

### Models & Relationships
Message belongs_to a conversation
Message belongs_to a sender

User has_and_belongs_to_many conversations

Conversation has_many messages

### Stretch Goals
- Emoji Leaderboard
- Friend relationships
- ASCII Art easter egg
