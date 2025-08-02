Gem::Specification.new do |s|
  s.name = 'rails_ship'
  s.version = '0.0.1'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Ship logic'
  s.description = '运输解决方案'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
  s.add_dependency 'rails_trade'
end
