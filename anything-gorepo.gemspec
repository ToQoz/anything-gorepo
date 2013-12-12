# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'anything-gorepo/version'

Gem::Specification.new do |spec|
  spec.name          = "anything-gorepo"
  spec.version       = AnythingGorepo::VERSION
  spec.authors       = ["Takatoshi Matsumoto"]
  spec.email         = ["toqoz403@gmail.com"]
  spec.description   = %q{Find local go repositories in $GOPATH by anything interface.}
  spec.summary       = %q{People who are tired of finding a golang repository in local! This is solution for it.}
  spec.homepage      = "http://github.com/ToQoz/anything-gorepo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "ruby-anything", ">= 0.0.4"
end
