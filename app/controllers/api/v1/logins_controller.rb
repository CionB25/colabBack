class Api::V1::LoginsController < ApplicationController
  # skip_before_action :authenticate

  def create
    url = "https://github.com/login/oauth/authorize?scope=user:email&client_id=#{ENV["CLIENT_ID"]}"
    redirect_to url
  end
end
