class ColabAdaptor
  def self.authorize(code)
    body = {
      :client_id => ENV["CLIENT_ID"],
      :client_secret => ENV["CLIENT_SECRET"],
      :code => session_code
    }
    result = RestClient.post("https://github.com/login/oauth/access_token",
      body,
      :accept => :json)

    JSON.parse(result)['access_token']
  end

  def self.get_user_data(token)
    github_auth = RestClient.get('https://api.github.com/user',
                                        {:params => {:access_token => token}})

    JSON.parse(github_auth)
  end


end
