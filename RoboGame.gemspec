# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RoboGame/version'

Gem::Specification.new do |spec|
  spec.name          = "RoboGame"
  spec.version       = RoboGame::VERSION
  spec.authors       = ["Mariusz Kulerski"]
  spec.email         = ["mariusz.kulerski@millwardbrown.com"]
  spec.summary       = %q{Proof of concept for RoboGame}
  spec.description   = %q{Please see https://github.com/DiscoverRedwolf/toyrobot for details}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
