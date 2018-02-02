class Api::V1::AuthController < ApplicationController
 skip_before_action :authorized, only: [:create, :show]
 def create
    user = User.find_by(username: params[:username])
    byebug
   if user && user.authenticate(params[:password])
      # issue that user a token
      token = issue_token(user)
      render json: {id: user.id, username: user.username, jwt: token}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end
 def show
    # token = request.headers['Authorization']
    # user = User.find_by(id: token)
    if logged_in?
      render json: { id: current_user.id, username: current_user.username }
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end
end
