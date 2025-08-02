Gem::Specification.new do |s|
  s.name = 'rails_notice'
  s.version = '1.0.3'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Notification Center for Rails Application'
  s.description = 'Description of RailsNotice.'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
end
