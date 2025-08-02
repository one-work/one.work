Gem::Specification.new do |s|
  s.name = 'rails_interact'
  s.version = '0.0.1'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_interact'
  s.summary = 'Summary of RailsInteract.'
  s.description = 'Description of RailsInteract.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com', '~> 1.2'
  s.add_dependency 'rails_notice', '>= 0.1'
  s.add_development_dependency 'sqlite3'
end
