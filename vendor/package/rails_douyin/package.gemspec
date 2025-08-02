Gem::Specification.new do |spec|
  spec.name = 'rails_douyin'
  spec.version = '0.0.1'
  spec.authors = ['qinmingyuan']
  spec.email = ['mingyuan0715@foxmail.com']
  spec.homepage = 'https://github.com/work-design/rails_douyin'
  spec.summary = 'Summary of RailsDouyin.'
  spec.description = 'Description of RailsDouyin.'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      '{app,config,db,lib}/**/*',
      'LICENSE',
      'Rakefile',
      'README.md'
    ]
  end

  spec.add_dependency 'rails'
end
