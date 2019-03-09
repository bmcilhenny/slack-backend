module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    def current_user
      # byebug
      @user ||= User.find_by(id: user_id)
    end

    def user_id
       decoded_token.first['user_id']
    end

    def decoded_token
      begin
        byebug
        # [{user_id: 1}, {algo: 'hs256'}]
        JWT.decode(token, ENV['jwt_secret'], true, { :algorithm => 'HS256' })
      rescue JWT::DecodeError
        [{}]
      end
    end

    def token
      request.params['token']
    end

  end
end
