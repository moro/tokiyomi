# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tokiyomi/version'

Gem::Specification.new do |gem|
  gem.name          = "tokiyomi"
  gem.version       = Tokiyomi::VERSION
  gem.authors       = ["moro"]
  gem.email         = ["moronatural@gmail.com"]
  gem.description   = %q{Japanese relative date/time string parser.}
  gem.summary       = %q{Japanese relative date/time string parser.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'activesupport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
