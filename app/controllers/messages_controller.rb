class MessagesController < ApplicationController
  before_filter :message_params, :only => [:create]
  protect_from_forgery with: :null_session
  
  def index
     @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
