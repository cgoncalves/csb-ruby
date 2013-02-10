# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csb/version'

Gem::Specification.new do |gem|
  gem.name          = "csb"
  gem.version       = Csb::Version
  gem.authors       = ["Carlos Gonçalves"]
  gem.email         = ["cgoncalves@av.it.pt"]
  gem.description   = %q{A Ruby interface to the Cloud Service Broker API using OAuth 1.0a}
  gem.summary       = gem.description
  gem.homepage      = 'http://atnog.av.it.pt/projects/cloud-service-broker'
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'json'
  gem.add_dependency 'oauth'
end
