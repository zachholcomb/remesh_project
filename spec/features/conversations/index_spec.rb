require 'rails_helper'

RSpec.describe 'conversations index page', type: :feature do
  before(:each) do
    @conversation_1 = create(:conversation)
    @conversation_2 = create(:conversation)
    visit '/conversations'
  end

  it 'shows all conversations' do
    expect(page).to have_content(@conversation_1.title)
    expect(page).to have_content(@conversation_2.title)
  end

  it 'links to conversation show page by title' do
    click_link(@conversation_1.title)
    expect(current_path).to eq("/conversations/#{@conversation_1.id}")

    visit '/conversations'
    click_link(@conversation_2.title)
    expect(current_path).to eq("/conversations/#{@conversation_2.id}")
  end

  it 'has a link to conversation create page' do
    click_link('Start New Conversation')
    expect(current_path).to eq("/conversations/new")
  end
end
