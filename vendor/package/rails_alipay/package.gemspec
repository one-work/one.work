Gem::Specification.new do |spec|
  spec.name = 'rails_alipay'
  spec.version = '0.0.1'
  spec.authors = [ "qinmingyuan" ]
  spec.email = [ "mingyuan0715@foxmail.com" ]
  spec.homepage = "https://github.com/work-design/rails_alipay"
  spec.summary = "Summary of RailsAlipay."
  spec.description = "Description of RailsAlipay."
  spec.license = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      "{app,config,db,lib}/**/*",
      "MIT-LICENSE",
      "Rakefile",
      "README.md"
    ]
  end

  spec.add_dependency "rails_com"
end
