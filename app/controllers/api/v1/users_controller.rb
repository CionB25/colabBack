class Api::V1::UsersController < ApplicationController

  def create
    login = params['username'].downcase


    user_data = JSON.parse(RestClient::Request.execute(method: :post,
      url: 'https://api.github.com/graphql',
      user: '80dbfbd448e0863e883da0490cc69a338075f489',
      payload: {"query": "{user(login: \"#{login}\") {id,login,avatarUrl,bio,url,
      repositories(last: 8) {edges {node {id,description,url,primaryLanguage {
        name},owner {login},name,languages(last: 6) {
          edges {node {name}}}}}}}}"}.to_json))
      # @user = User.find_or_create_by(user_params(user_data,params))
      # @user.create_users(user_params(user_data,params))
      @user = User.find_by(username: user_data['data']['user']["login"])
      if @user
        @user
      else
        @user = User.create(user_params(user_data,params))
      end
      @user.create_repos(user_data['data']['user']['repositories']['edges'])

      token = issue_token(@user)
      @user.jwt = token
      render json: @user
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end


    private

  def user_params(user_data,params)
    params = {
      username: user_data['data']['user']["login"],
      avatarUrl: user_data['data']['user']['avatarUrl'],
      bio: user_data['data']['user']['bio'],
      url: user_data['data']['user']['url'],
      email:params['email'],
    password:params['password']
    }
  end


end
# (user_data['data']['user']['repositories']['edges'].each {|repo| Repository.create(name:self.id, owner_username:self.username, description: user_data['data']['user']['repositories']['edges'][0]['node']['name'].gsub("-"," ").titleize, url: repo['node']['url'])})
