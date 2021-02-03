class Message < ApplicationRecord
  belongs_to :conversation
  has_many :thoughts
  validates :text, presence: true
end
