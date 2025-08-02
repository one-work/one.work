Gem::Specification.new do |spec|
  spec.name        = 'rails_jia_bo'
  spec.version     = '0.0.1'
  spec.authors     = [ "qinmingyuan" ]
  spec.email       = [ "mingyuan0715@foxmail.com" ]
  spec.homepage    = "https://github.com/work-design/rails_jia_bo"
  spec.summary     = "Summary of RailsJiaBo."
  spec.description = "Description of RailsJiaBo."
  spec.license     = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      '{app,config,db,lib}/**/*',
      'MIT-LICENSE',
      'Rakefile',
      'README.md'
    ]
  end

  spec.add_dependency "rails", ">= 7.2.1"
end
