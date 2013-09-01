# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'where_from/version'

Gem::Specification.new do |spec|
  spec.name          = "where_from"
  spec.version       = WhereFrom::VERSION
  spec.authors       = ["Andy Bryant"]
  spec.email         = ["ar.bryant@btinternet.com"]
  spec.description   = %q{Add additional methods to Class and Module to assist with code instrospection}
  spec.summary       = %q{Code reflection monkey-patches}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "debugger"
end
