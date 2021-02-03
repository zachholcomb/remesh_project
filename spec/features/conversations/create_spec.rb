require 'rails_helper'

RSpec.describe "Conversation Create Page", type: :feature do
  before(:each) do
    @conversation = create(:conversation)
    visit '/conversations/new'
  end

  it 'can create a conversation with the correct information' do
    fill_in(:title, :with => "How's it going?")
    click_button('Create Conversation')
    
    new_convo = Conversation.last
    expect(new_convo.title).to eq("How's it going?")
    expect(new_convo.start_date).to eq(Date.today)
    expect(Conversation.all.count).to eq(2)

    expect(current_path).to eq('/conversations')
    expect(page).to have_content(new_convo.title)
    expect(page).to have_content("Your Conversation Was Started!")
  end

  it 'cant create conversation without a title' do
    click_button('Create Conversation')
    expect(page).to have_content("Whoops! Looks like you forgot a title!")
    expect(page).to have_content('Create Conversation')
    expect(Conversation.all.count).to eq(1)
  end
end
