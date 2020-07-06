class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  # Allow one user to join a one chat
  def create
    # Compare Chatroom ID and User ID
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    redirect_to chatrooms_path
  end

  def destroy
    #Just for safety we delete all records about our connections
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
