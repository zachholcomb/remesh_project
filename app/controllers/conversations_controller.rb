class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end
  
  def show
    @conversation = Conversation.find(params[:id])
  end

  def new; end

  def create
    conversation = Conversation.create(title: params[:title], start_date: Date.today)
    if conversation.save
      flash[:success] = "Your Conversation Was Started!"
      redirect_to conversations_path
    else
      flash[:error] = "Whoops! Looks like you forgot a title!"
      render :new
    end
  end
end
