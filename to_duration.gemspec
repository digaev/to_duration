# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_duration/version'

Gem::Specification.new do |spec|
  spec.name          = 'to_duration'
  spec.version       = ToDuration::VERSION
  spec.authors       = ['Nikolay Digaev']
  spec.email         = ['ffs.cmp@gmail.com']

  spec.summary       = %q{A Ruby gem for converting seconds into human-readable format.}
  spec.description   = %q{A Ruby gem for converting seconds into human-readable format.}
  spec.homepage      = 'https://github.com/digaev/to_duration'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
