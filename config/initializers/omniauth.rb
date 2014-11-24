OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '594370410691941', '3230f969ef086d3f5acbbbd4261dda29'
end