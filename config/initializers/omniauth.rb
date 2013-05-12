OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :angellist, 'b6c71de53a4a9aa288dbfe331d053d6a', '23510adee56542a99bae3f5f7cef4df3', :scope => 'email'
end