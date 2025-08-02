Gem::Specification.new do |s|
  s.name = 'rails_doc'
  s.version = '0.0.2'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_doc'
  s.summary = 'Generate Api doc from nornal rails project with very little works'
  s.description = 'Description of RailsDoc.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com', '>= 1.2'
end
