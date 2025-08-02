Gem::Specification.new do |spec|
  spec.name        = "rails_bluetooth"
  spec.version     = '0.0.1'
  spec.authors     = [ "qinmingyuan" ]
  spec.email       = [ "mingyuan0715@foxmail.com" ]
  spec.homepage    = "https://github.com/work-design/rails_bluetooth"
  spec.summary     = "Summary of RailsBluetooth."
  spec.description = "Description of RailsBluetooth."
  spec.license     = "MIT"


  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      "{app,config,db,lib}/**/*",
      "MIT-LICENSE",
      "Rakefile",
      "README.md"
    ]
  end

  spec.add_dependency "rails", ">= 7.2.1"
end
