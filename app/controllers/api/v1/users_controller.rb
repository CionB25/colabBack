class Api::V1::UsersController < ApplicationController
  # skip_before_action :authenticate

  def create

      session_code = params["code"]
      body = {
        :client_id => ENV["CLIENT_ID"],
        :client_secret => ENV["CLIENT_SECRET"],
        :code => session_code
      }

      result = RestClient.post("https://github.com/login/oauth/access_token",
        body,
        :accept => :json)

      access_token = JSON.parse(result)['access_token']


      user_data = JSON.parse(RestClient.get('https://api.github.com/user',
                                          {:params => {:access_token => access_token}}))

      username = user_data['login']


      repos = JSON.parse(RestClient.get("https://api.github.com/users/#{username}/repos",
                                          {:params => {:access_token => access_token}}))

    #
    # if the user authorized it, fetch private emails
      user_data['private_emails'] =
        JSON.parse(RestClient.get('https://api.github.com/user/emails',
                                  {:params => {:access_token => access_token}}))

      # auth_token = ColabAdaptor.authorize(params["code"])
      # user_data = ColabAdaptor.get_user_data(auth_token)

      @user = User.find_or_create_by(user_params(user_data))


      payload = {:access_token => access_token}
      token = JWT.encode payload, ENV["MY_SECRET"], ENV["ES"]

      @user.update(access_token: token)
      render json: {username: @user.username, code: @user.access_token}
    # end
  end

    private

  # def user_with_token(user)
  #   payload = {user_id: user.id}
  #   token = issue_token(payload)
  #   newUser = UserSerializer.new(user).attributes
  #   { token: token, currentUser: newUser }
  # end

  def user_params(user_data)
    params = {
      username: user_data["login"],
      avatarUrl: user_data["avatar_url"],
      bio: user_data["bio"],
      url: user_data["url"]
    }
  end

end
