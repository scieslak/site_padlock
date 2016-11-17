$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "site_padlock/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "site_padlock"
  s.version     = SitePadlock::VERSION
  s.authors     = ["scieslak"]
  s.email       = ["scieslak@scieslak.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SitePadlock."
  s.description = "TODO: Description of SitePadlock."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
