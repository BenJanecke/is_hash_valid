# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'is_hash_valid/version'

Gem::Specification.new do |spec|
  spec.name          = "is_hash_valid"
  spec.version       = IsHashValid::VERSION
  spec.authors       = ["Ben Janecke"]
  spec.email         = ["benjanecke@gmail.com"]
  spec.summary       = %q{A simple hash validator.}
  spec.description   = %q{A simple hash validator that allows you to do complex validations with custom error messages.}
  spec.homepage      = "https://github.com/BenJanecke/is_hash_valid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
end
