Gem::Specification.new do |s|
  s.name = 'rails_finance'
  s.version = '0.0.1'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_finance'
  s.summary = 'Summary of Rails Finance'
  s.description = 'Description of RailsDoc.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
  s.add_dependency 'prawn'
end
