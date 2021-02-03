class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :thoughts, through: :messages, dependent: :destroy

  validates :title, :start_date, presence: true

  class << self
    def search(params)
      cleaned_query = "%#{params[:search]}%"
      Conversation.where("title LIKE ?", cleaned_query)
    end
  end
end
