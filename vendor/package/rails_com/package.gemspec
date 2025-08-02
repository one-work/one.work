Gem::Specification.new do |s|
  s.name = 'rails_com'
  s.version = '1.3.0'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Rails Engine with common utils'
  s.description = 'Common utils for Rails Application'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'Rakefile',
    'LICENSE',
    'README.md'
  ]
  s.require_paths = ['lib']

  s.add_dependency 'rails'
  s.add_dependency 'solid_queue'
  s.add_dependency 'solid_cache'
  s.add_dependency 'httpx'
  s.add_dependency 'http-form_data', '~> 2.3'
  s.add_dependency 'default_where', '~> 2.2'
  s.add_dependency 'kaminari'
  s.add_dependency 'closure_tree', '>= 7.3'
  s.add_dependency 'positioning'
  s.add_dependency 'acme-client'
  s.add_dependency 'turbo-rails'
  s.add_dependency 'money-rails', '~> 1.15'
  s.add_dependency 'net-http'
  s.add_dependency 'net-pop'
  s.add_dependency 'net-scp'
  s.add_dependency 'sshkey'
  s.add_dependency 'ostruct'
  s.add_dependency 'csv'
  s.add_dependency 'mutex_m'
  s.add_dependency 'reline'

  s.add_development_dependency 'listen'
end
