# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 2.6.3'

gem 'sinatra',              '~> 2.0', '>= 2.0.5'
gem 'puma',                 '~> 3.12', '>= 3.12.1', group: :production

# assets
gem 'sass',                 '~> 3.7', '>= 3.7.4'
gem 'sprockets',            '~> 3.7', '>= 3.7.2'
gem 'bootstrap',            '~> 4.3', '>= 4.3.1'
gem 'uglifier',             '~> 4.1', '>= 4.1.20'

# data persistence
gem 'activerecord',         '~> 5.2', '>= 5.2.3'
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.13'
gem 'rake',                 '~> 12.3', '>= 12.3.2' # to apply migrations
gem 'pg',                   '~> 1.1', '>= 1.1.4'
gem 'bcrypt',               '~> 3.1', '>= 3.1.12'

gem 'require_all',          '~> 2.0'

group :development do
  gem 'rerun'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'racksh',              '~> 1.0'
  gem 'tux',                 '~> 0.3.0'
end

group :test do
  gem 'capybara',            '~> 3.19', '>= 3.19.1'
  gem 'database_cleaner',    '~> 1.7'
  gem 'factory_bot',         '~> 5.0', '>= 5.0.2'
  gem 'faker',               '~> 1.9', '>= 1.9.3'
  gem 'rack-test',           '~> 1.1'
  gem 'rspec',               '~> 3.8'
  gem 'selenium-webdriver',  '~> 3.142', '>= 3.142.2'
end
