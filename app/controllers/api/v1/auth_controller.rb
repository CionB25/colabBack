class Api::V1::AuthController < ApplicationController

      def create

        user = User.find_by(email: params['email'])

        if user && user.authenticate(params['password'])
          token = issue_token(user)

          render json: {id: user.id, username: user.username, jwt:token}

        else
          render json: {error: 'Count not authorize this user'}, status: 401

        end
      end

      def show

        user = User.find_by(id: user_id)

        if logged_in?
          render json: user

        else
          render json: {error: 'Could not find this user'}, status: 401

        end
      end

end
