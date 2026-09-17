Gem::Specification.new do |s|
  s.name = 'rails_auth'
  s.version = '1.2.0'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'understandable, simple auth logic for Rails'
  s.description = '更容易理解的auth'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']

  s.add_dependency 'rails_com', '~> 1.2'
  s.add_dependency 'bcrypt', '~> 3.1'
  s.add_dependency 'rotp'
  s.add_dependency 'jwt'
end
