# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'comicvine/version'

Gem::Specification.new do |spec|
  spec.name          = "comicvine"
  spec.version       = Comicvine::VERSION
  spec.authors       = ["Andrew Kozlov"]
  spec.email         = ["sazor.mail@gmail.com"]
  spec.summary       = %q{ Handsome API client for the best comic library ComicVine. }
  spec.description   = ""
  spec.homepage      = "https://github.com/sazor/comicvine"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

  spec.add_runtime_dependency "httparty" # just like party
  spec.add_runtime_dependency "activesupport"
end
