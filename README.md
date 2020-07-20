# Guild Education - API Challenge
 [![Coverage](https://jennyallar.github.io/messaging-api/badge.svg)](https://github.com/jennyallar/messaging-api)
 
## Requirements
- Global API with no security parameters
- Allows two users to send messages to each other (see: Facebook Messages & Google Chat
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

## Brainstorming

- Pagination may be useful
- Requirements state chat between 1:1. Consideration: don't tie messages to a receiver- this could leave things open for unlimited users in a chat

### Models & Relationships
Message belongs_to a conversation
Message belongs_to a sender

User has_and_belongs_to_many conversations

Conversation has_many messages
Conversation has_and_belongs_to_many users

## UML diagrams

```mermaid
sequenceDiagram
Web App ->> Chat API: GET request: {}
Bob-->>John: How about you John?
Bob--x Alice: I am good thanks!
Bob-x John: I am good thanks!
Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

Bob-->Alice: Checking with John...
Alice->John: Yes... John, how are you?
```

And this will produce a flow chart:

```mermaid
graph LR
A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D
```

### Stretch Goals
- Emoji Leaderboard
- Friend relationships
