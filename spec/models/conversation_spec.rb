require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :start_date }
  end

  describe 'relationships' do
    it { should have_many :messages }
    it { should have_many :thoughts }
  end
end
