class Api::V1::RequestsController < ApplicationController
  def create

    @user = User.find_by(username: params['username'])
    @repo = Repository.find_by(name: params['reponame'])

    # if @user
      @request = Request.find_or_create_by(repository_id: @repo.id, ownername: params['username'])
      render json: @request
    # else
    #   render json: {error: 'Unauthorized Request'}, status: 401
    # end
    # byebug
  end

  def show

  end

  def index

    @user = User.find_by(username: params['username'])

# byebug
    if @user
    # requests = @user.requests.collect {|req| req.repository}
    requests = Request.all.select {|req| req.ownername == @user.username}
    request_repos = requests.collect {|req| req.repository}

    array = Request.all.select {|req| req.ownername != @user.username}
    repos = array.map {|req| req.repository}
    my_requested  = repos.select {|repo| repo.owner_username == @user.username}
    # my_requested = repos.collect {|req| req.repository}

    render json: {mine: request_repos, theirs: my_requested}
    # byebug
  else
    render json: {error: "Please log in"}
  end
  end

end
#my_requests = Requests.all.select {|request| request.ownername == username}
 # request_repos = my_requests.collect {|req| req.repository}
 # -----------------
 # requests = Request.all.select {|req| req.ownername != @user.username}
 # repos = requests.map {|req| req.repository}
 # my_requested = repos.select {|repo| repo.owner_username == avi}

# owner_username
