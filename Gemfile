source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem "pundit"
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bulma-rails', '~> 0.9.0'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rolify', '~> 5.3'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.0', '>= 5.0.3'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.14'
  gem 'rails_best_practices', '~> 1.20'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1' # RSpec is a testing framework
  gem 'rubocop', '~> 1.0.0', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
  gem 'simplecov', '~> 0.19.1', require: false
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
