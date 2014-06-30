$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auto_presenter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auto_presenter"
  s.version     = AutoPresenter::VERSION
  s.authors     = ["Alberto Fernandez-Capel"]
  s.email       = ["afcapel@gmail.com"]
  s.homepage    = "http://github.com/afcapel/auto_presenter"
  s.summary     = "Automatically wraps your view instance variable with presenters."
  s.description = "AutoPresenter uses convention over configuration to remove the bolierplate code to use presenters in your rails app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"

  s.add_development_dependency "sqlite3"
end
