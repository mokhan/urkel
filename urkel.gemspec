# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'urkel/version'

Gem::Specification.new do |spec|
  spec.name          = "urkel"
  spec.version       = Urkel::VERSION
  spec.authors       = ["mo khan"]
  spec.email         = ["mo@mokhan.ca"]
  spec.summary       = %q{A client gem for posting errors to an urkel server.}
  spec.description   = %q{A client gem for posting errors to an urkel server.}
  spec.homepage      = "https://github.com/mokhan/urkel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
