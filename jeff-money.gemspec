require_relative 'lib/jeff_money.rb'

Gem::Specification.new do |s|
  s.name = 'jeff-money'
  s.version = ::JeffMoney::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.1'
  s.authors = ['Geoffroy GOBERT']
  s.description = <<-DESCRIPTION
     Convert currency. Built for a challenge to check some ruby internal skills.
  DESCRIPTION

  s.email = 'gobertgeoffroy@gmail.com'
  s.files = `git ls-files`
            .split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.extra_rdoc_files = ['README.md']
  s.homepage = 'https://github.com/gobert/jeff-money'
  s.licenses = ['MIT']
  s.summary = 'Currency Convertor'

  s.add_development_dependency('bundler', '>= 1.16.0.pre.3')

  s.add_development_dependency('pry-byebug', '>= 3.5.0')

  s.add_development_dependency('rspec', '>= 3.7.0')
  s.add_development_dependency('simplecov', '>= 0.13')

  s.add_development_dependency('rubocop', '>= 0.50.0')
  s.add_development_dependency('rubocop-rspec', '>= 1.18.0')

  s.add_development_dependency('codeclimate-test-reporter', '>= 1.0.8')
end
