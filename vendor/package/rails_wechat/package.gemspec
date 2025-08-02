Gem::Specification.new do |s|
  s.name = 'rails_wechat'
  s.version = '0.1.2'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_wechat'
  s.summary = 'Wechat Master'
  s.description = '微信集成一揽子解决方案'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
  s.add_dependency 'rqrcode'
end
