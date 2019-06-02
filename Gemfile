# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

gem 'devise'
gem 'pry'
gem 'pry-rails'

gem 'enum_help'

gem 'nested_form'
gem 'ransack'

gem 'font-awesome-sass'

gem 'bootstrap_form', '>= 4.2.0'
gem 'simple_form'

gem 'paper_trail' # https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail-association_tracking'

gem 'carrierwave'

# https://github.com/rubysherpas/paranoia
gem 'paranoia', '~> 2.2'

gem 'kaminari'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Implements rubocop command for Spring. https://github.com/toptal/spring-commands-rubocop
  gem 'spring-commands-rubocop'

  # RuboCop is a Ruby static code analyzer and code formatter. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide. https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 0.63.1', require: false

  # RSpec-specific analysis for your projects, as an extension to RuboCop.
  # Read more: https://github.com/rubocop-hq/rubocop-rspec
  gem 'rubocop-rspec'

  # IDE tools for the Ruby language.
  # Read more: https://github.com/castwide/solargraph
  gem 'solargraph', '0.31.2'

  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to its default testing framework, Minitest.
  # Read more: https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 3.8'

  # RSpec 2 & 3 results that your CI can read. Jenkins, Buildkite, CircleCI, and probably more, too.
  # Read more: https://github.com/sj26/rspec_junit_formatter
  gem 'rspec_junit_formatter'

  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners that test common Rails functionality:
  # Read more: https://matchers.shoulda.io, https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda'
  gem 'shoulda-matchers'

  # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies: https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails'

  # This gem is a port of Perl's Data::Faker library that generates fake data.: https://github.com/stympy/faker
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Really fast deployer and server automation tool.
  # Read more: https://github.com/mina-deploy/mina
  gem 'mina'

  # Mina tasks for handle with Puma.
  # Read more: https://github.com/sandelius/mina-puma
  gem 'mina-puma'

  # mina-sidekiq is a gem that adds tasks to aid in the deployment of Sidekiq using Mina.
  # Read more: https://github.com/Mic92/mina-sidekiq
  gem 'mina-sidekiq'

  # This gem implements the rspec command for Spring.
  gem 'spring-commands-rspec'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  # Database Cleaner is a set of strategies for cleaning your database in Ruby. :https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner'
end
