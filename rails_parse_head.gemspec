# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_parse_head/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_parse_head'
  spec.version       = RailsParseHead::VERSION
  spec.authors       = ['Boris BRESCIANI']
  spec.email         = ['boris2bresciani@gmail.com']

  spec.summary       = 'Parse head html'
  spec.description   = 'Parse head html (https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head)'
  spec.homepage      = 'https://github.com/BorisBresciani/rails_parse_head'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'

  spec.add_dependency 'http', '~> 4.4'
  spec.add_dependency 'nokogiri', '~> 1.10'
end
