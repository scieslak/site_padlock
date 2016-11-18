$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "site_padlock/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "site_padlock"
  s.version     = SitePadlock::VERSION
  s.authors     = ["scieslak"]
  s.email       = ["sitepadlock@gmail.com"]
  s.homepage    = "https://github.com/scieslak/site_padlock"
  s.summary     = "SitePadlock, easy website authentication"
  s.description = "SitePadlock is a Ruby on Rails engine, providing a quick and easy implementation of bcrypt based authentications system on a personal website."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'bcrypt', '3.1.11'
  s.add_development_dependency 'guard',                      '2.14'
  s.add_development_dependency 'guard-minitest',             '2.4.6'
  s.add_development_dependency 'minitest-reporters',         '1.1.12'
  s.add_development_dependency 'simplecov',                  '0.12.0'
  s.add_development_dependency 'codeclimate-test-reporter',  '0.4.8'
end
