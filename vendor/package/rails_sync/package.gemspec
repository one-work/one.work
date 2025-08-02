Gem::Specification.new do |s|
  s.name = 'rails_sync'
  s.version = '0.1'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_sync'
  s.summary = 'Summary of RailsSync.'
  s.description = 'Description of RailsSync.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
end
