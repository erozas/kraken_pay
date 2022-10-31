# frozen_string_literal: true

require_relative 'lib/kraken_pay/version'

Gem::Specification.new do |spec|
  spec.name = 'kraken_pay'
  spec.version = KrakenPay::VERSION
  spec.authors = ['Exequiel Rozas']
  spec.email = ['exequiel98@gmail.com']

  spec.summary = 'Kraken Pay es una gema para interactuar con la API de pagos de Kraken Bolivia'
  spec.description = 'Kraken Pay es una gema para interactuar con la API de pagos de Kraken Bolivia que permite generar pagos usando la pasarela de pagos de Kraken y también pagos con código QR'
  spec.homepage = 'https://github.com/petservi/kraken_pay'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/erozas/kraken_pay'
  spec.metadata['changelog_uri'] = 'https://github.com/erozas/kraken_pay'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_development_dependency 'pry'

  spec.add_dependency 'httparty'
  spec.add_dependency 'oj'
end
