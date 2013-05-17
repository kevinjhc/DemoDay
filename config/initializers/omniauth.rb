OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :angellist, 'b6c71de53a4a9aa288dbfe331d053d6a', '23510adee56542a99bae3f5f7cef4df3', :scope => 'email'
  elsif Rails.env.development?
    provider :angellist, '9fcaaeb6b432956f86ddb1ec0481052d', '1b511416e0ed6d3056b393968ce31f7b', :scope => 'email'
  end
  provider :identity,
    on_failed_registration: lambda { |env| IdentitiesController.action(:new).call(env) }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}