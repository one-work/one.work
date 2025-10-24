source 'https://rubygems.org'
git_source(:gitee) { |repo| "https://gitee.com/#{repo}.git" }

# 核心依赖
gem 'rails', '8.1.0'
gem 'pg'
gem 'puma'
gem 'jbuilder'
gem 'kamal', '2.8.1', require: false
gem 'rails_deploy', path: 'engine/rails_deploy', require: false

# Utils
gem 'bcrypt'
gem 'image_processing'
gem 'mini_magick'
gem 'rqrcode'
gem 'rexml'
gem 'nokogiri'
gem 'sd_notify'
gem 'mqtt', github: 'njh/ruby-mqtt'

# Third party
gem 'octokit'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
git 'https://gitee.com/tencentcloud/tencentcloud-sdk-ruby.git' do
  gem 'tencentcloud-sdk-common'
  #gem 'tencentcloud-sdk-ocr'
end
gem 'aliyunsdkcore'

# Payment method
#gem 'paypal-sdk-core'
#gem 'paypal-sdk-rest'

# Files
gem 'upyun_rails', gitee: 'qinmingyuan/upyun_rails'

# Rails Helpers
gem 'default_where', gitee: 'qinmingyuan/default_where'

# Engines
gem 'rails_com', path: 'engine/rails_com'
gem 'rails_crm', path: 'engine/rails_crm'
gem 'rails_cms', path: 'engine/rails_cms'
gem 'rails_doc', path: 'engine/rails_doc'
gem 'rails_org', path: 'engine/rails_org'
gem 'rails_auth', path: 'engine/rails_auth'
gem 'rails_data', path: 'engine/rails_data'
gem 'rails_ship', path: 'engine/rails_ship'
gem 'rails_sync', path: 'engine/rails_sync'
gem 'rails_audit', path: 'engine/rails_audit'
gem 'rails_bench', path: 'engine/rails_bench'
gem 'rails_email', path: 'engine/rails_email'
gem 'rails_event', path: 'engine/rails_event'
gem 'rails_trade', path: 'engine/rails_trade'
gem 'rails_alipay', path: 'engine/rails_alipay'
gem 'rails_attend', path: 'engine/rails_attend'
gem 'rails_design', path: 'engine/rails_design'
gem 'rails_detail', path: 'engine/rails_detail'
gem 'rails_douyin', path: 'engine/rails_douyin'
gem 'rails_growth', path: 'engine/rails_growth'
gem 'rails_notice', path: 'engine/rails_notice'
gem 'rails_wechat', path: 'engine/rails_wechat'
gem 'rails_factory', path: 'engine/rails_factory'
gem 'rails_finance', path: 'engine/rails_finance'
gem 'rails_space', path: 'engine/rails_space'
gem 'rails_interact', path: 'engine/rails_interact'
gem 'rails_markdown', path: 'engine/rails_markdown'
gem 'rails_bluetooth', path: 'engine/rails_bluetooth'
gem 'rails_print', path: 'engine/rails_print'
gem 'rails_one_ai', path: 'engine/rails_one_ai'

gem 'propshaft'

# Debug
group :development, :test do
  gem 'debug', require: 'debug/prelude'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'brakeman'
  gem 'sass-embedded'
  gem 'tidewave'
end
