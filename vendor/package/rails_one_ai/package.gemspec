Gem::Specification.new do |spec|
  spec.name = 'rails_one_ai'
  spec.version = '0.0.1'
  spec.authors = [ "qinmingyuan" ]
  spec.email = [ "mingyuan0715@foxmail.com" ]
  spec.homepage = 'https://github.com/work-design/rails_one_ai'
  spec.summary = 'Ai Api integer'
  spec.description = "Description of RailsKimi."
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      "{app,config,db,lib}/**/*",
      "MIT-LICENSE",
      "Rakefile",
      "README.md"
    ]
  end

  spec.add_dependency "rails", ">= 8.0.1"
end
