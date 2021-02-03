class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :thoughts, through: :messages, dependent: :destroy
  
  validates :title, :start_date, presence: true
end
