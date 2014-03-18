# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doneski/version'

Gem::Specification.new do |spec|
  spec.name          = "doneski"
  spec.version       = Doneski::VERSION
  spec.authors       = ["Chad McKenna"]
  spec.email         = ["chad.mckenna@gmail.com"]
  spec.summary       = %q{A simple task management CLI}
  spec.description   = %q{A simple task management CLI similar in usage to PivotalTracker.}
  spec.homepage      = "https://github.com/chadmckenna/doneski"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
