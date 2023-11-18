require 'oauth2'

module Oauth
  def self.client
    OAuth2::Client.new(OAUTH_CLIENT_ID, OAUTH_SECRET, site: OAUTH_AUTH_HOST)
  end

  def self.authorize_url
    client.auth_code.authorize_url(redirect_uri: OAUTH_CALLBACK_URL)
  end
end
