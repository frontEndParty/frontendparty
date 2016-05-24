require 'bundler'
Bundler.setup :default

require 'sprockets'
require 'coffee-script'
require './app'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/javascripts'
  # environment.append_path 'vendor/assets/jquery'
  run environment
end

map '/' do
  run FrontEndParty.new
end
