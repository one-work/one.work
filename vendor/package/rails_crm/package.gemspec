Gem::Specification.new do |s|
  s.name = 'rails_crm'
  s.version = '0.0.2'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Summary of RailsCrm'
  s.description = 'Description of RailsCrm'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_trade'
end
