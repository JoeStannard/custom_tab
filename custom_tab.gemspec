require File.expand_path('../lib/custom_tab/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'custom_tab'
  s.version     = CustomTab::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Joe Stannard']
  s.email       = ['stannajl@miamioh.edu']
  s.homepage    = 'http://rubygems.org/stannajl/custom_tab'
  s.summary     = 'Adds a new cusomizable tab to Foreman host page.'
  # also update locale/gemspec.rb
  s.description = 'Change which fields are on or off from the yaml file'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
