# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skypescraper/version'

Gem::Specification.new do |spec|
  spec.name          = "skypescraper"
  spec.version       = Skypescraper::VERSION
  spec.authors       = ["Pavel Nosov"]
  spec.email         = ["soundrussian@gmail.com"]

  spec.summary       = %q{Extracts data from Skype database.}
  spec.description   = %q{Import conversations and messages from a Skype database with ruby!}
  spec.homepage      = "http://github.com/soundrussian/skypescraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
