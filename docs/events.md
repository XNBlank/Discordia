## Events
WebSocket events are received by the client, and their associated data is processed accordingly. The Client object then broadcasts the following events, which may be subscribed to by client or bot scripts. Arguments are listed next to each event name where appliciable.

---

### General

#### `ready`
Fired after the client logs in and establishes a working WebSocket connection. Internally, the data from this event is used to populate most of the stored objects, but the data is not emitted.

#### `resume`
Fired when a client successfully resumes a WebSocket connection after being unexpectedly disconnected.

---

### User

#### `userUpdate` - User
Fired when the client's own user settings are changed. The *User* argument is always *client.user*.

#### `presenceUpdate` - User
Fired when a user's online status, game status, or certain user settings are changed.

#### `typingStart` - User, TextChannel
Fired when a user starts typing in a channel. The user can either be a private message recipient or a server member. The channel could be either a *PrivateChannel* or *ServerTextChannel*.

---

### Server

#### `serverCreate` - Server
Fired when a server is created. Effectively, when the client joins a server.

#### `serverDelete` - Server
Fired when a server is deleted. Effectively, when the client leaves a server.

#### `serverUpdate` - Server
Fired when the settings of a server are changed, such as the name, region, owner, etc.

#### `membersChunk` - Server
Fired when member data is received. Servers with more than 250 members are considered large. Their member data is sent in chunks rather than all at once during the *ready* event.

---

### Channel

#### `channelCreate` - PrivateChannel or ServerChannel
Fired when a channel of any type is created.

#### `channelDelete` - PrivateChannel or ServerChannel
Fired when a channel of any type is deleted.

#### `channelUpdate` - PrivateChannel or ServerChannel
Fired when the settings of a channel are changed, such as the name, topic, position, etc.

#### `typingStart` - User, TextChannel
Fired when a user starts typing in a channel. This could be either a *PrivateChannel* or *ServerTextChannel*.

---

### Member

#### `memberJoin` - Member
Fired when a member joins a server. The corresponding server can be accessed at *member.server*.

#### `memberLeave` - Member
Fired when a member leaves a server. The corresponding server can be accessed at *member.server*.

#### `memberUpdate` - Member
Fired when a member changes their settings. The corresponding server can be accessed at *member.server*.

#### `memberBan` - Member
Fired when a member is banned from a server. The corresponding server can be accessed at *member.server*.

#### `memberUnban` - Member
Fired when a member is banned from a server. The corresponding server can be accessed at *member.server*.

---

### Message

#### `messageCreate` - Message
Fired when a message is created in a channel. The corresponding channel can be accessed at *message.channel*.

#### `messageDelete` - Message
Fired when a message is delete from a channel. The corresponding channel can be accessed at *message.channel*.

#### `messageUpdate`- Message
Fired when an existing message is edited. The corresponding channel can be accessed at *message.channel*.

#### `messageAcknowledge` - Message
Fired when a message is acknowledged(?) The corresponding channel can be accessed at *message.channel*.

---

### Role

#### `roleCreate` - Role
Fired when a role is created on a server. The corresponding server can be accessed at *role.server*.

#### `roleDelete` - Role
Fired when a role is deleted from a server. The corresponding server can be accessed at *role.server*.

#### `roleUpdate` - Role
Fired when a role is changed on a server. The corresponding server can be accessed at *role.server*.

---

### Voice

#### `voiceJoin` - voiceState
Fired when a server member joins a voice channel.
#### `voiceLeave` - voiceState
Fired when a server member changes mute or deafen settings.
#### `voiceUpdate` - voiceState
Fired when a server member leaves a voice channel.

---

### Custom

*Note:* These events are not associated with any specific Discord WebSocket event. They are library features implemented for convenience.

#### `raw` - payload
Fired for every received WebSocket message, except when it disconnects. The full payload is provided as a Lua table in its original format, before being "camelified".

#### `disconnect` - expected
Fired when the client's WebSocket unexpectedly disconnects. The expected argument is a boolean indicating whether the disconnection was expected or not. An expected disconnection is one that occurs after calling `Client:logout()`. Not guaranteed to fire before program termination.
