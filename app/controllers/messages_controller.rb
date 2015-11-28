class MessagesController < ApplicationController
  before_filter :message_params, :only => [:create]
  before_action :set_message, only: [:edit, :update, :destroy]
  protect_from_forgery with: :null_session
  
  def index
     @messages = Message.all
     @message = Message.new
  end
  
  def edit
  end
  
  def update
    if message.update(message_params)
      redirect_to root_path, notice: 'メッセージを更新しました'
    else
      render 'edit'
    end
  end
  
  def create
    @message = Message.new(message_params)
    puts params
    if @message.save
      redirect_to root_path, notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
