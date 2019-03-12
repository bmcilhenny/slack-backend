class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update_last_seen, :update]

  def index
    team = Team.find(params[:team_id])
    @teammates = team.users.reject{|teammate| current_user.id == teammate.id }
    render json: @teammates #, include: ['channels', 'channels.users', 'channels.messages', 'channels.messages.user']
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, include: ['channels', 'channels.users', 'channels.messages', 'channels.messages.user', 'team']
    else
      render json: {error: 'Unable to save user'}, status: 406
    end
  end

  def show
    team = Team.find(params[:team_id])
    @user = team.users.find(params[:id])
    # byebug
    render json: @user, include: ['channels', 'channels.users', 'channels.messages', 'channels.messages.user', 'team']
  end

  # NOT BEING USED
  def update
    team = Team.find(params[:team_id])
    @user = team.users.find(params[:id])

    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update_last_seen
    # byebug
    user = User.find(params[:user_id])
    user_channel = user.user_channels.find_by(channel_id: params[:channel_id])
    user_channel.update!(last_seen: DateTime.now)
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation, :display_name, :image_url, :team_id, :user_id, :channel_id)
  end
end
