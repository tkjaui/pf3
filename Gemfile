# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'active_storage_validations', '0.8.9'
gem 'bcrypt',                     '3.1.13'
gem 'bootsnap',                   '1.4.6', require: false
gem 'bootstrap-sass',             '3.4.1'
gem 'faker',                      '2.11.0'
gem 'image_processing',           '1.9.3'
gem 'jbuilder',                   '2.10.0'
gem 'mini_magick',                '4.9.5'
gem 'puma',                       '4.3.5'
gem 'sass-rails',                 '6.0.0'
gem 'turbolinks',                 '5.2.1'
gem 'webpacker',                  '4.2.2'

group :development, :test do
  gem 'byebug', '11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~>3.9'
  gem 'sqlite3', '1.4.2'
end

group :development do
  gem 'listen', '3.2.1'
  gem 'rubocop', require: false
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '4.0.2'
end

group :test do
  gem 'capybara',                 '3.32.2'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '5.13.0'
  gem 'minitest-reporters',       '1.3.8'
  gem 'rails-controller-testing', '1.0.4'
  gem 'selenium-webdriver',       '3.142.7'
  gem 'webdrivers',               '4.3.0'
end

group :production do
  gem 'aws-sdk-s3', '1.46.0', require: false
  gem 'pg',         '1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'bulma-rails'
gem 'devise'
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'kaminari'
