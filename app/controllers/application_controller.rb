class ApplicationController < ActionController::API

  def  issue_token(user)
    JWT.encode({user_id: user.id}, ENV['MY_SECRET'],'HS256')
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def token
    request.headers['Authorization']
    # byebug
  end

  def decoded_token
    begin
      # [{user_id: 1}, {algo: 'hs256'}]
      JWT.decode(token, ENV['MY_SECRET'], true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{}]
    end
  end

  def user_id
    # token = request.headers['Authorization']
    # byebug
    # decoded = JWT.decode(token,'secret',true,{:algorithm => 'HS256'})
    decoded_token.first["user_id"]
  end

  def logged_in?
    !!current_user
  end

end

ENV['MY_SECRET']
