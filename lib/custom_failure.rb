class CustomFailure < Devise::FailureApp
  def redirect_url
    new_user_session_url(:subdomain => 'secure')
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      self.status = :unauthorized
      self.response_body = { error: 'Invalid login credentials. Please try again.' }.to_json
      self.content_type = 'json'
    end
  end
end