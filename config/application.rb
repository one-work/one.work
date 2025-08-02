require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module OneWork
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.autoload_paths += Dir[
      "#{config.root}/app/models/oauth_user",
      "#{config.root}/app/models/verify_token",
      "#{config.root}/app/models/provider"
    ]
    config.eager_load_paths += Dir[
      "#{config.root}/app/models/oauth_user",
      "#{config.root}/app/models/verify_token",
      "#{config.root}/app/models/provider"
    ]

    config.time_zone = 'Beijing'
    config.ssl_options = { hsts: { subdomains: true } }
    config.logger = ActiveSupport::Logger.new(config.default_log_file, 'daily')
    config.generators do |g|
      g.stylesheets false
      g.javasricpts false
      g.javascript_engine false
      g.helper false
      g.jbuilder true
    end
    config.server_timing = true
    config.middleware.delete ActionDispatch::RequestId # 记录X-Request-Id（方便查看请求在群集中的哪台执行）
    config.i18n.default_locale = :zh

    config.active_job.queue_adapter = :solid_queue

    config.active_record.belongs_to_required_by_default = true
    config.active_record.encryption.support_unencrypted_data = true
    config.active_record.encryption.support_sha1_for_non_deterministic_encryption = true

    config.action_controller.forgery_protection_origin_check = true
    config.action_controller.per_form_csrf_tokens = true

    config.action_view.form_with_generates_remote_forms = true
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      html_tag
    end

    config.solid_queue.connects_to = { database: { writing: :queue } }
  end
end

ENV['EDITOR'] = 'vi'
SETTING = Rails.application.credentials
