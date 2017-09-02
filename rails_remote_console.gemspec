# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_remote_console/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_remote_console'
  spec.version       = RailsRemoteConsole::VERSION
  spec.authors       = ['James Huynh']
  spec.email         = ['james@rubify.com']

  spec.summary       = %(Load Rails Remote Console)
  spec.description   = %(Load Rails Remote Console)
  spec.homepage      = 'https://github.com/jameshuynh/rails_remote_console'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
end
