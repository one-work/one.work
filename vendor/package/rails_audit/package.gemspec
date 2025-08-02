Gem::Specification.new do |s|
  s.name = 'rails_audit'
  s.version = '1.0.4'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Audit changes for model with operator'
  s.description = 'Description of RailsAudit'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails_com', '~> 1.2'
end
