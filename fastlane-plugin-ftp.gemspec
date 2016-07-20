# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/ftp/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-ftp'
  spec.version       = Fastlane::Ftp::VERSION
  spec.author        = %q{Allan Vialatte}
  spec.email         = %q{allan.vialatte@icloud.com}

  spec.summary       = %q{Simple ftp upload and download for Fastlane}
  spec.homepage      = "https://github.com/PoissonBallon/fastlane-ftp-plugin"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.95.0'
end
