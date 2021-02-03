class ThoughtsController < ApplicationController
  def create
    message = Message.find(params['message_id'])
    thought = Thought.create(text: params[:text], message: message)
    if thought.save
      flash[:success] = 'Comment Added!'
      redirect_to conversation_path(params['conversation_id'].to_i)
    else
      flash[:error] = 'Comment needs text!'
      redirect_to "/conversations/#{params['conversation_id']}/messages/#{params['message_id']}"
    end
  end
end
