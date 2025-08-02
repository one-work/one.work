Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :solid_cache_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.log_level = :debug

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = {
    host: 'http://lvh.me:3000'
  }
  config.action_mailer.smtp_settings = {
    address: 'smtp.exmail.qq.com',
    port: 465,
    authentication: :login,
    user_name: Rails.application.credentials.dig(:mailer, :user_name),
    password: Rails.application.credentials.dig(:mailer, :password),
    ssl: true,
    return_response: true
  }

  config.action_mailbox.ingress = :relay

  config.action_view.annotate_rendered_view_with_filenames = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.active_storage.service = :upyun
  config.active_storage.logger = nil
  config.active_storage.resolve_model_to_route = :rails_storage_proxy
  config.active_storage.variant_processor = :vips

  #config.action_controller.asset_host = '7u2gfi.com1.z0.glb.clouddn.com'

  config.action_cable.disable_request_forgery_protection = true
  config.action_cable.allowed_request_origins = [
    'http://localhost:3000',
    'http://lvh.me:3000'
  ]
  config.hosts += [
    '.lvh.me',
    '.admin.lvh.me',
    '.frp.work.design'
  ]

  config.x.role_debug = false
end
ActiveRecord.verbose_query_logs = true

#ActionCable.server.config.logger = Logger.new(nil)
