class User < ApplicationRecord
  attr_accessor :jwt
  has_secure_password

  has_many :repositories
  has_many :requests, through: :repositories

  def create_users
    @user = User.find_by(username: user_data['data']['user']["login"].downcase)
    if @user
      @user
    else
      User.create(method)
    end
  end

  def create_repos(array)
      array.each do |repo|
        title = repo['node']['name'].gsub("-"," ").titleize
        # ghr_id = repo['node']['id']
        # language = repo['node']['primaryLanguage']['name']
        # link = repo['node']['url']
        # story = repo['node']['description']
        # byebug
        # @repository = Repository.find_by(name: repo['node']['name'].gsub("-"," ").titleize)
        # if @repository
        #   @repository
        # else
          # Repository.create(name:repo['node']['name'].gsub("-"," ").titleize,
          # user_id:self.id, gh_repo_id:repo['node']['id'],owner_username:self.username, description: repo['node']['description'],
          # url: repo['node']['url'], primaryLanguage: repo['node']['primaryLanguage']['name'])
    # array.each do |repo|
      # id = self.id
      # owner = self.username
      # hash = {name:repo['node']['name'].gsub("-"," ").titleize, user_id:self.id, owner_username:self.username, description: repo['node']['description'], url: repo['node']['url']}
      # Repository.find_or_create_by(hash)

      Repository.find_or_create_by(name:title,user_id:self.id,owner_username:self.username,primaryLanguage: repo['node']['primaryLanguage']['name'],description: repo['node']['description'],url: repo['node']['url'])
      # #   Repository.where(name:repo['node']['name'].gsub("-"," ")).first_or_create do |repo|
      # #     user_id:self.id,
      # #     owner_username:self.username,
      # #     description: repo['node']['description'],
      # #     url: repo['node']['url']
      # # end
    # Repository.where(name:repo['node']['name'].gsub("-"," ")).first_or_create
      # Repository.where(name:repo['node']['name'].gsub("-"," ").titleize, user_id:self.id, owner_username:self.username, description: repo['node']['description'], url: repo['node']['url']).first_or_create
      # end
    end
  end

end
# ,description:story,primaryLanguage:language
# gh_repo_id:ghr_id

# primaryLanguage: repo['node']['primaryLanguage']['name']
# gh_repo_id:repo['node']['id']
# url: repo['node']['url']
# description: repo['node']['description']
