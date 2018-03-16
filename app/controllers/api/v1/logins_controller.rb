class Api::V1::LoginsController < ApplicationController
  # skip_before_action :authenticate

  def create


results = JSON.parse(RestClient::Request.execute(method: :post,url: 'https://api.github.com/graphql',user: 'ce14492a48de184ad0c00d92d458ab8cc63bf6b3',payload: {"query": "{user(login: \"cionb25\") {login,avatarUrl,bio,url,repositories(last: 5) {edges {node {description,url,primaryLanguage {name},owner {login},name,languages(last: 6) {edges {node {name}}}}}}}}"}.to_json))

    # url = "https://github.com/login/oauth/authorize?scope=user:email&client_id=#{ENV["CLIENT_ID"]}"
    # redirect_to url
  end
end
