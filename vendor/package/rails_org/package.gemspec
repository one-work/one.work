Gem::Specification.new do |s|
  s.name = 'rails_org'
  s.version = '0.0.1'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'understandable, simple auth logic for Rails'
  s.description = 'SaaS multi org with members module'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']

  s.add_dependency 'rails_com'
end
