# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slackcat/version'

Gem::Specification.new do |spec|
  spec.name          = "slackcat"
  spec.version       = Slackcat::VERSION
  spec.authors       = ["Richard Lister"]
  spec.email         = ["rlister@gmail.com"]
  spec.description   = %q{Upload a file to Slack chat}
  spec.summary       = %q{Upload a file to slack}
  spec.homepage      = "https://github.com/rlister/slackcat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'httmultiparty'
  spec.add_dependency 'trollop'
end
