Gem::Specification.new do |spec|
  spec.name = "default_form"
  spec.version = '0.0.1'
  spec.authors = [ "qinmingyuan" ]
  spec.email = [ "mingyuan0715@foxmail.com" ]
  spec.homepage = 'https://github.com/work-design/default_form.git'
  spec.summary = 'Summary of DefaultForm.'
  spec.description = 'Description of DefaultForm.'
  spec.license = "MIT"

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      "{app,config,db,lib}/**/*",
      "MIT-LICENSE",
      "Rakefile",
      "README.md"
    ]
  end

  spec.add_dependency "rails", ">= 7.1.1"
end
