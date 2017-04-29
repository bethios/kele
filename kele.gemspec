# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kele/version'

Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2017-04-27'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Beth Cummings']
  s.email         = 'bethios@gmail.com'
  s.files         = ['lib/kele.rb', 'lib/roadmap.rb']
  s.require_paths = ["lib"]
  s.homepage      =
      'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  #spec.add_development_dependency "bundler", "~> 1.14"
  #spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "rspec", "~> 3.0"
end
