if ENV["SELENIUM"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.