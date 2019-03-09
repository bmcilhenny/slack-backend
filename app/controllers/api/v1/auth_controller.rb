class Api::V1::AuthController < ApplicationController
 skip_before_action :authorized, only: [:create, :show]

 def create
    team = Team.find(params[:team_id])
    user = team.users.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      # issue that user a token
      byebug
      token = issue_token(user)
      render json: {id: user.id, username: user.username, jwt: token, display_name: user.display_name, team: user.team}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

  # add user has many teams, team has many users relationship
 def show
    if logged_in?
      render json: { id: current_user.id, username: current_user.username, display_name: current_user.display_name, team: current_user.team, last_seen_channel: current_user.last_seen_channel}
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end
end
