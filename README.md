# event-planning-api
Event management system for planning events

## API:

### Events, authorization is required:
- GET /event  
  Returs array of all of the events that you are in.  
  Url options: optional:
  - due=[timestamp]  
  - interval=[integer]d
- POST /events  
  Creates new event  
  Data params: 
  { event: { time: [timestamp], place: [string], description: [text], attachments: [array of files] } }
- GET /events/:id  
  Returns event with given id
- PUT/PATCH /events/:id  
  Updates event with given id  
  Data params: 
  { event: { time: [timestamp], place: [string], description: [text], attachments: [array of files] } }
- DELETE /events/:id  
  Deletes event with given id

### Messages (Dashboard), authorization is required:
- GET    /events/:event_id/messages  
  Returns messages for event
- POST   /events/:event_id/messages  
  Creates new message  
  Data params: 
  { event_id: [integer], message: { text: string } }
- PUT/PATCH    /events/:event_id/messages/:id  
  Updates message  
  Data params: 
  { event_id: [integer], message: { text: string } }
- DELETE /events/:event_id/messages/:id  
  Deletes message with given id

### Invites, authorization is required:
- GET    /invites  
  Returs array of all of the invites that you sent or were sent to you.
- POST   /invites  
  Creates new invite and adds invited user to the event  
  Data params: 
  { event_id: [integer], email: [string] }
- GET    /invites/:id  
  Returns invite with given id
- PUT/PATCH /invites/:id  
  Updates invite with given id  
  Data params: 
  { event_id: [integer], email: [string] }
- DELETE /invites/:id
  Deletes invite with given id

### Feed, authorization is required:
- GET    /feed  
  Returs array of latest changes of your events (comments, file additions)

### Users:
- POST   /oauth/token  
  Returns auth token and signs you in  
  Data params: 
  { grant_type=password, email: [string], password: [string] }
- DELETE /users/sign_out
  Signs you out
- POST   /users  
  Creates new user  
  Data params: 
  { name: [string], email: [string], password: [string], , password_confirmation: [string] }
