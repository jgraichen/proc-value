# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)\

Gem::Specification.new do |spec|
  spec.name          = 'proc-value'
  spec.version       = '1.0'
  spec.authors       = ['Jan Graichen']
  spec.email         = ['jg@altimos.de']
  spec.description   = %q{Proc::Value allows transparent block evaluation on all objects using #value method.}
  spec.summary       = %q{Proc::Value allows transparent block evaluation on all objects using #value method.}
  spec.homepage      = 'https://github.com/jgraichen/proc-value'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
