class Thought < ApplicationRecord
  belongs_to :message
  validates :text, presence: true
end
