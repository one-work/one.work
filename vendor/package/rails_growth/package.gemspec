Gem::Specification.new do |spec|
  spec.name = 'rails_growth'
  spec.version = '0.0.1'
  spec.authors = ['qinmingyuan']
  spec.email = ['mingyuan0715@foxmail.com']
  spec.homepage = 'https://github.com/work-design/rails_growth'
  spec.summary = '增长策略'
  spec.description = 'Description of RailsGrowth.'
  spec.license = 'MIT'

  spec.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  spec.add_dependency 'rails_com', '~> 1.2'
end
