require 'rails_helper'

RSpec.describe 'Conversations search', type: :feature do
  before(:each) do
    @conversation = Conversation.create(title: "The Mandalorian", start_date: Date.today)
    @conversation_2 = Conversation.create(title: "What Now?", start_date: Date.today)
  end

  it 'can search for conversations by full match' do
    visit '/'
    within '.search' do
      fill_in(:search, with: @conversation.title)
      click_button('Search')
    end
    expect(page).to have_content(@conversation.title)
    expect(page).to_not have_content(@conversation_2.title)
    
    # Search bar on search results index page
    within '.search' do
     fill_in(:search, with: @conversation_2.title)
      click_button('Search')
    end
    expect(page).to have_content(@conversation_2.title)
    expect(page).to_not have_content(@conversation.title)
  end

  it 'can search by partial match' do
    visit '/'
    within '.search' do
      fill_in(:search, with: 'The ')
      click_button('Search')
    end
    expect(page).to have_content(@conversation.title)
    expect(page).to_not have_content(@conversation_2.title)
  end

  it 'returns no results if no matches' do
    visit '/'
    within '.search' do
      fill_in(:search, with: 'Nonsense')
      click_button('Search')
    end
    expect(page).to have_content('No Conversations match your criteria, search again?')
  end
end