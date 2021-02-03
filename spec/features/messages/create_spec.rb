require 'rails_helper'

RSpec.describe "Create messages feature", type: :feature do
  before(:each) do
    @conversation = create(:conversation, start_date: Date.today)
    visit "/conversations/#{@conversation.id}"
  end

  it 'creates messages for selected conversation' do
    fill_in(:text, with: "I'm not sure about this!")
    click_button('Add Message')
    expect(page).to have_content("I'm not sure about this!")
    expect(page).to have_content('Message Added!')

    expect(Message.count).to eq(1)
    expect(@conversation.messages.count).to eq(1)
  end

  it 'cant create message without text' do
    click_button('Add Message')
    expect(page).to have_content('Message needs text!')

    expect(@conversation.messages.count).to eq(0)
  end
end
