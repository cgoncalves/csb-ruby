# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csb/version'

Gem::Specification.new do |gem|
  gem.name          = "csb"
  gem.version       = Csb::VERSION.dup
  gem.authors       = ["Carlos Gonçalves"]
  gem.email         = ["cgoncalves@av.it.pt"]
  gem.description   = %q{A Ruby interface to the Cloud Service Broker API using OAuth 1.0a}
  gem.summary       = gem.description
  gem.homepage      = 'http://atnog.av.it.pt/projects/cloud-service-broker'
  gem.licenses      = ['MIT']
  gem.platform      = Gem::Platform::RUBY

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('json', '~> 1.7.7')  if RUBY_VERSION < '1.9'
  gem.add_runtime_dependency('hashie', '~> 1.2.0')
  gem.add_runtime_dependency('faraday', '~> 0.8.5')
  gem.add_runtime_dependency('faraday_middleware', '~> 0.9.0')
  gem.add_runtime_dependency('jruby-openssl', '~> 0.7.2') if RUBY_PLATFORM == 'java'
  gem.add_runtime_dependency('multi_json', '~> 1.6.1')
  gem.add_runtime_dependency('multi_xml', '~> 0.5.3')
  gem.add_runtime_dependency('rash', '~> 0.3.2')
  gem.add_runtime_dependency('simple_oauth', '~> 0.2.0')
end
