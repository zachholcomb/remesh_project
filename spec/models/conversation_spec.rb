require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :start_date }
  end

  describe 'relationships' do
    it { should have_many :messages }
    it { should have_many(:thoughts).through(:messages) }
  end

  describe '.class_methods' do
    before(:each) do
      @conversation = Conversation.create(title: "The Mandalorian", start_date: Date.today)
      @conversation_2 = Conversation.create(title: "What Now?", start_date: Date.today)
    end
    it '.search' do
      search_params = {'search': @conversation.title}
      expect(Conversation.search(search_params).length).to eq(1)

      partial_search_params = {'search': 'The'}
      expect(Conversation.search(partial_search_params).length).to eq(1)
      
      search_params = {'search': 'NO RESULTS HERE'}
      expect(Conversation.search(search_params).length).to eq(0)
    end
  end
end
