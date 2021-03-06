class ConversationsController < ApplicationController
  before_action :find_conversation, except: :index
  before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @personal_message = PersonalMessage.new
  end

  private
  def find_conversation
    @conversation = Conversation.find params[:id]
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end

end
