Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.dig(:github, :key), Rails.application.credentials.dig(:github, :secret), scope: 'user,repo,gist'
end
