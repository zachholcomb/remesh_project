class MessagesController < ApplicationController
  def create
    message = Message.create(text: params['text'], conversation_id: params['conversation_id'].to_i)
    if message.save
      flash[:success] = 'Message Added!'
    else
      flash[:error] = 'Message needs text!'
    end
    redirect_to conversation_path(params['conversation_id'].to_i)
  end

  def show
    conversation = Conversation.find(params[:conversation_id].to_i)
    @message = conversation.messages.find(params[:id].to_i)
  end
end
