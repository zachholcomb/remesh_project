require 'rails_helper'

RSpec.describe 'Conversation show page', type: :feature do
  before(:each) do
    @conversation = create(:conversation)
    @messages = create_list(:message, 5, conversation: @conversation)
    @messages.each do |message|
      create_list(:thought, 5, message: message)
    end
  end

  it 'displays a list of all messages' do
    visit "/conversations/#{@conversation.id}"
    @messages.each do |message|
      expect(page).to have_content(message.text)
      expect(page).to have_content(message.created_at)
      within "#message-#{message.id}" do
        message.thoughts.each do |thought|
          expect(page).to have_content(thought.text)
        end
      end
    end
  end
end
