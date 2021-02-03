require 'factory_bot_rails'

Thought.destroy_all
Message.destroy_all
Conversation.destroy_all

# CONVERSATIONS
conversations = FactoryBot.create_list(:conversation, 5, start_date: Date.today)

# MESSAGES
conversations.each do |convo|
  FactoryBot.create_list(:message, 5, conversation: convo)
end

# THOUGHTS
messages = Message.all
messages.each do |message|
  FactoryBot.create_list(:thought, 5, message: message)
end
