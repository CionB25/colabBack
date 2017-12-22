class ApplicationController < ActionController::API
  # include Knock::Authenticable
  #
  # private
  #
  # def authenticate_v1_user
  #   authenticate_for V1::User
  # end
  # 
  # before_action :authenticate
  #
  #
  # def logged_in?
  #   !!current_user
  # end
  #
  # def current_user
  #   if auth_present?
  #     user.find(auth["user"])
  #     if user
  #       @current_user ||= user
  #     end
  #   end
  # end
  #
  # def authenticate
  #   render json: {error: "unathorized"}, status: 401
  #    unless logged_in?
  #    end
  # end
  #
  # private
  #
  # def token
  #   request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last
  # end
  #
  # def auth
  #   Auth.decode(token)
  # end
  #
  # def auth_present?
  #   !!request.env.fetch("HTTP_AUTHORIZATION","").scan(/Bearer/).flatten.first
  # end
end
