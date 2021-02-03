require 'rails_helper'

RSpec.describe 'Create thought feature', type: :feature do
  before(:each) do
    @conversation = create(:conversation, start_date: Date.today)
    @messages = create_list(:message, 5, conversation: @conversation)
    @messages.each do |message|
      create_list(:thought, 3, message: message)
    end
    @original_thought_count = Thought.all.count
    visit "/conversations/#{@conversation.id}"
  end

  it 'creates new thoughts for a selected message' do
    message = Message.first
    within "#message-#{message.id}" do
      click_link('Comment')
    end
    expect(current_path).to eq("/conversations/#{@conversation.id}/messages/#{message.id}")
    expect(page).to have_content("Conversation: #{@conversation.title}")
    expect(page).to have_content(message.text)
    fill_in(:text, with: "This is really cool!")
    click_button('Add Thought')

    new_thought = Thought.last
    expect(Thought.all.count).to eq((@original_thought_count + 1))
    expect(message.thoughts.last.text).to eq(new_thought.text)
    expect(current_path).to eq("/conversations/#{@conversation.id}")
    expect(page).to have_content('Comment Added!')
    within "#message-#{message.id}" do
      expect(page).to have_content(new_thought.text)
    end
  end

  it 'cant create new thought without text' do
    message = Message.first
    within "#message-#{message.id}" do
      click_link('Comment')
    end
    expect(current_path).to eq("/conversations/#{@conversation.id}/messages/#{message.id}")
    click_button('Add Thought')
    expect(@original_thought_count).to eq(Thought.count)
    expect(current_path).to eq("/conversations/#{@conversation.id}/messages/#{message.id}")
    expect(page).to have_content('Comment needs text!')
  end
end
