require 'rails_helper'

RSpec.describe 'Conversation show page', type: :feature do
  before(:each) do
    @conversation = create(:conversation)
    @messages = create_list(:message, 5, conversation: @conversation)
  end

  it 'displays a list of all messages' do
    visit "/conversations/#{@conversation.id}"
    @messages.each do |message|
      expect(page).to have_content(message)
    end
  end
end
