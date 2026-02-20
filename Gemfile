source 'https://rubygems.org'
git_source(:gitee) { |repo| "https://gitee.com/#{repo}.git" }

# 核心依赖
gem 'rails', github: 'rails/rails'
gem 'pg'
gem 'puma'
gem 'jbuilder'
gem 'kamal', '2.10.1', require: false
gem 'rails_deploy', path: 'engine/rails_deploy', require: false

# Utils
gem 'bcrypt'
gem 'image_processing'
gem 'mini_magick'
gem 'rqrcode'
gem 'rexml'
gem 'nokogiri'
gem 'sd_notify'
gem 'net-ssh-gateway'
gem 'xsv'
gem 'psych-pure'

# Third party
gem 'octokit'
gem 'omniauth-rails_csrf_protection'
#git 'https://gitee.com/tencentcloud/tencentcloud-sdk-ruby.git' do
  #gem 'tencentcloud-sdk-common'
  #gem 'tencentcloud-sdk-ocr'
#end
gem 'aliyunsdkcore'

# Payment method
#gem 'paypal-sdk-core'
#gem 'paypal-sdk-rest'

# Files
gem 'upyun_rails', github: 'qinmingyuan/upyun_rails'

# Rails Helpers
gem 'default_where', github: 'one-work/default_where'
gem 'default_form', path: 'engine/default_form'

# Engines
gem 'rails_com', path: 'engine/rails_com'
gem 'rails_crm', path: 'engine/rails_crm'
gem 'rails_cms', path: 'engine/rails_cms'
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
gem 'rails_ui', path: 'engine/rails_ui'
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
gem 'rails_print', path: 'engine/rails_print'
gem 'rails_one_ai', path: 'engine/rails_one_ai'

gem 'propshaft'

# Debug
group :development, :test do
  gem 'debug', require: 'debug/prelude'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'sass-embedded'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'brakeman'
  gem 'tidewave'
end
