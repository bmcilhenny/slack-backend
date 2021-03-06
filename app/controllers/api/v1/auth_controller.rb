class Api::V1::AuthController < ApplicationController
 skip_before_action :authorized, only: [:create, :show]

 def create
    team = Team.find(params[:team_id])
    user = team.users.find_by(username: params[:username])

   if user && user.authenticate(params[:password])

      # issue that user a token
      token = issue_token(user)
      render json: {id: user.id, username: user.username, jwt: token, display_name: user.display_name, team: user.team}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

 def show
    @user = User.find_by(id: user_id)
    if logged_in?
      render json: { id: @user.id, username: @user.username, display_name: @user.display_name, team: @user.team, channel_list_data: channel_data_for_channel_list }
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end
end
