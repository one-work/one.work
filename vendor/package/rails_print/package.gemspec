Gem::Specification.new do |s|
  s.name = 'rails_print'
  s.version = '0.0.1'
  s.authors = [ 'qinmingyuan' ]
  s.email = [ "mingyuan0715@foxmail.com" ]
  s.homepage = 'https://github.com/work-design/rails_print'
  s.summary = "Summary of RailsJiaBo."
  s.description = "Description of RailsJiaBo."
  s.license = 'MIT'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      '{app,config,db,lib}/**/*',
      'MIT-LICENSE',
      'Rakefile',
      'README.md'
    ]
  end

  s.add_dependency "rails", ">= 7.2.1"
end
