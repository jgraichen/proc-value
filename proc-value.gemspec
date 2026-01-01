# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'proc-value'
  spec.version       = '1.0.1'
  spec.authors       = ['Jan Graichen']
  spec.email         = ['jgraichen@altimos.de']
  spec.description   = 'Proc::Value allows transparent block evaluation on all objects using #value method.'
  spec.summary       = 'Proc::Value allows transparent block evaluation on all objects using #value method.'
  spec.homepage      = 'https://github.com/jgraichen/proc-value'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.7.0'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']
end
