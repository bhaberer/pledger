# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pledger/version'

Gem::Specification.new do |spec|
  spec.name          = "pledger"
  spec.version       = Pledger::VERSION
  spec.authors       = ["Brian Haberer"]
  spec.email         = ["bhaberer@gmail.com"]
  spec.description   = %q{Simple client to send pledges to chat services.}
  spec.summary       = %q{Indiegogo => Hipchat}
  spec.homepage      = "https://github.com/bhaberer/pledger"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency                 'hipchat'
  spec.add_dependency                 'nokogiri'

  spec.add_development_dependency     'bundler',    '~> 1.3'
  spec.add_development_dependency     'rspec'
  spec.add_development_dependency     'coveralls'
  spec.add_development_dependency     'rake'
end
