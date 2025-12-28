RailsCom.config.tap do |config|
  if Rails.env.development?
    config.acme_url = 'https://acme-staging-v02.api.letsencrypt.org/directory'
  end
  config.disable_debug = true
  config.notify_bot = 'WorkWechatBot'
  config.notify_key = "#{Rails.application.credentials[:log_bot_key]}"
  config.default_admin_accounts = Rails.application.credentials[:admin_accounts]
  config.debug = true
  config.debug_i18n = false
  config.quiet_logs += [
    '/assets',
    '/images'
  #'/rails/active_storage'
  ]
  config.ignore_models += []
  config.override_prefixes = [
    'application'
  ]
end
