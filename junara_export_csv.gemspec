# frozen_string_literal: true

require_relative 'lib/junara_export_csv/version'

Gem::Specification.new do |spec|
  spec.name          = 'junara_export_csv'
  spec.version       = JunaraExportCsv::VERSION
  spec.authors       = ['junara']
  spec.email         = ['jun5araki@gmail.com']

  spec.summary       = 'Export CSV for personal.'
  spec.description   = 'Export CSV for personal.'
  spec.homepage      = 'https://github.com/junara'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/junara'
  spec.metadata['changelog_uri'] = 'https://github.com/junara'

  spec.add_dependency 'csv'
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
