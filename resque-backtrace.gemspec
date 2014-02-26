# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "resque-backtrace"
  spec.version       = "0.0.1"
  spec.authors       = ["Cameron Desautels"]
  spec.email         = ["camdez@gmail.com"]
  spec.description   = "Log backtraces from exceptions in Resque jobs"
  spec.summary       = spec.summary
  spec.homepage      = "http://github.com/orgsync/resque-backtrace"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency('resque', '>= 1.0')
end
