class ConversationsSearchController < ApplicationController
  def index
    @results = Conversation.search(search_params)
  end

  private

  def search_params
    params.permit(:search)
  end
end