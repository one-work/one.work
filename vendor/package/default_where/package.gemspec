$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name = 'default_where'
  s.version = '2.3.0'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/qinmingyuan/default_where'
  s.summary = 'default process params for where'
  s.description = 'Default where'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']

  s.add_runtime_dependency 'activerecord'
  s.add_development_dependency 'sdoc', '~> 1.0'
  s.add_development_dependency 'rake', '~> 12.3'
end
