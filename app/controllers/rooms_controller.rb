class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    if @single_room.present?
      @messages = @single_room.messages
    else
      @messages = @current_user.messages
    end
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render "index"
  end
end
