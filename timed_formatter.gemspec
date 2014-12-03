# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timed_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "timed_formatter"
  spec.version       = TimedFormatter::VERSION
  spec.authors       = ["TJ Taylor"]
  spec.email         = ["dugancathal@gmail.com"]
  spec.summary       = %q{An RSpec3 Formatter that prints the runtime for each spec}
  spec.description   = %q{Ever wanted to know how long a spec took BEFORE your whole suite is done? Well look no further.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec", "~> 3.0"
end
