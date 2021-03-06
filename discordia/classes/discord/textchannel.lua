local Deque = require('../utils/deque')
local Base = require('./base')
local Server = require('./server')
local Message = require('./message')
local endpoints = require('../../endpoints')

local TextChannel = class('TextChannel', Base)

function TextChannel:__init(data, client)

	Base.__init(self, data.id, client)

	self.isPrivate = data.isPrivate
	self.lastMessageId = data.lastMessageId

	self.messages = {}
	self.deque = Deque()

end

function TextChannel:createMessage(content)
	local body = {content = content}
	local data = self.client:request('POST', {endpoints.channels, self.id, 'messages'}, body)
	if data then return Message(data, self) end
end

function TextChannel:sendMessage(content) -- alias for createMessage
	return self:createMessage(content)
end

function TextChannel:getMessageHistory()
	local data = self.client:request('GET', {endpoints.channels, self.id, 'messages'})
	local messages = {}
	for _, messageData in ipairs(data) do
		table.insert(messages, Message(messageData, self))
	end
	return messages
end

function TextChannel:getMessageById(id)
	return self.messages[id]
end

return TextChannel
