class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :show, :update_last_seen]

  def index
    team = Team.find(params[:team_id])
    @users = team.users.all
    render json: @users, include: ['channels', 'channels.users', 'channels.messages', 'channels.messages.user']
  end

  def show
    team = Team.find(params[:team_id])
    @user = team.users.find(params[:id])
    render json: @user, include: ['channels', 'channels.users', 'channels.messages', 'channels.messages.user']
  end

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
    user = User.find(params[:user_id])
    user_channel = user.user_channels.find_by(channel_id: params[:channel_id])
    user_channel.update!(last_seen: DateTime.now)
  end

  private
  def user_params
    params.permit(:username, :password, :display_name, :image_url, :team_id, :user_id, :channel_id)
  end
end
