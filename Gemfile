source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.9'
gem 'bcrypt',                     '3.1.13'
gem 'faker',                      '2.11.0'
gem 'will_paginate',              '3.3.0'
gem 'bootstrap-will_paginate',    '1.0.0'
gem 'bootstrap-sass',             '3.4.1'
gem 'puma',                       '4.3.5'
gem 'sass-rails',                 '6.0.0'
gem 'webpacker',                  '4.2.2'
gem 'turbolinks',                 '5.2.1'
gem 'jbuilder',                   '2.10.0'
gem 'bootsnap',                   '1.4.6', require: false

group :development, :test do
  gem 'sqlite3', '1.4.2'
  gem 'byebug',  '11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~>3.9'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console',           '4.0.2'
  gem 'listen',                '3.2.1'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.32.2'
  gem 'selenium-webdriver',       '3.142.7'
  gem 'webdrivers',               '4.3.0'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.13.0'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
  
end

group :production do
  gem 'pg',         '1.2.3'
  gem 'aws-sdk-s3', '1.46.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'refile', require: "refile/rails", github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'bulma-rails'