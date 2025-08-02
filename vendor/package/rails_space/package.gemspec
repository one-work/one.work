Gem::Specification.new do |s|
  s.name = 'rails_space'
  s.version = '0.0.1'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Summary of RailsSpace.'
  s.description = 'Description of RailsSpace.'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
end
