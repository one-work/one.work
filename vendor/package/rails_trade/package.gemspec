Gem::Specification.new do |s|
  s.name = 'rails_trade'
  s.version = '0.0.3'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Rails engine for trade, payment and more'
  s.description = 'trade, payment'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
  s.add_dependency 'rails_notice'
end
