# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'

gem 'mini_magick', '~> 4.8'

gem 'cancancan'
gem 'devise'
gem 'pry'
gem 'pry-rails'

gem 'enum_help'

gem 'nested_form'
gem 'ransack'

gem 'font-awesome-sass'

gem 'bootstrap_form', '>= 4.2.0'
gem 'simple_form'

gem 'paper_trail-association_tracking'

gem 'carrierwave'

gem 'paranoia', '~> 2.2'

gem 'kaminari'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'factory_bot_rails'

gem 'faker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'spring-commands-rubocop'

  gem 'rubocop', '~> 0.63.1', require: false

  gem 'rubocop-rspec'

  gem 'solargraph', '0.31.2'

  gem 'rspec-rails', '~> 3.8'

  gem 'rspec_junit_formatter'

  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  gem 'mina'

  gem 'mina-puma'

  gem 'mina-sidekiq'

  gem 'foreman'

  gem 'mina-webpacker'

  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'

  gem 'database_cleaner'
end
