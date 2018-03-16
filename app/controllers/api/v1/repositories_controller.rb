class Api::V1::RepositoriesController < ApplicationController

  def index
    @repositories = Repository.all

    render json: @repositories
  end

end
