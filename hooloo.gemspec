# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hooloo/version'

Gem::Specification.new do |spec|
  spec.name          = "hooloo"
  spec.version       = Hooloo::VERSION
  spec.authors       = ["Peter Lejeck"]
  spec.email         = ["me@plejeck.com"]
  spec.summary       = %q{Unofficial Client for the Hulu "Hidden" API}
  spec.description   = <<-DESC
Based on the magic of APIs, we are now capable of connecting to Hulu and retrieving their data for
use in other applications.  A warning to ye who dare use this, however: Hulu does not guarantee
this API's stability, so it's possible (even likely) that your applications may break at any time.

This library is based on the work of {hulu-php-library}[https://github.com/adammagana/hulu-php-library],
an unofficial PHP client for this same API.
  DESC
  spec.homepage      = "http://github.com/nuckchorris/hooloo/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'multi_json', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "fakeweb"
end
