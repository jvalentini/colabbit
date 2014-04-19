# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colabbit/version'

Gem::Specification.new do |spec|
  spec.name          = "colabbit"
  spec.version       = Colabbit::VERSION
  spec.authors       = ["Justin Valentini"]
  spec.email         = ["justin.valentini@gmail.com"]
  spec.summary       = %q{Parse Excel files looking for problems}
  spec.description   = %q{Parse Excel files looking for problems}
  spec.homepage      = "http://www.colabbit.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-plus"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "fuubar"

  spec.add_runtime_dependency "axlsx"
  spec.add_runtime_dependency "roo"
end
