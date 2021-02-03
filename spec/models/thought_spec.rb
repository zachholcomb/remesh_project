require 'rails_helper'

RSpec.describe Thought, type: :model do
  describe 'validations' do
    it { should validate_presence_of :text }
  end

  describe 'relationships' do
    it { should belong_to :message }
  end
end
