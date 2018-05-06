source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby File.read(File.expand_path('../.ruby-version', __FILE__), mode: 'rb').chomp

gem 'rails', '~> 5.1.4'

# Configuration management (settings.yml and settings.local.yml)
gem 'choices'

# Redis adapter (for Action Cable and Sidekiq)
gem 'redis'
gem 'redis-rails'
gem 'redis-namespace'
gem 'redis-browser'

# PostgreSQL
gem 'pg'
gem 'mongoid'

# Allow for db:data:dump and db:data:load rake tasks
gem 'yaml_db', github: 'K-and-R/yaml_db'

# Proper eager loading for ActiveRecord
gem 'goldiloader'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'# To use ActiveModel has_secure_password

# debugging (should be available in production)
gem 'better_errors'

# Console (not just developmnet because someitme we need a console in other environments)
gem 'pry-rails'
gem 'pry-plus', github: 'K-and-R/pry-plus'
gem 'awesome_print'

# Use SCSS for stylesheets
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# View templating
gem 'slim-rails'

#  Model form generation
gem 'simple_form'

# Error reporting
gem 'sentry-raven', github: 'getsentry/raven-ruby'

# Email validation
gem 'email_validator', github: 'karlwilbur/email_validator', :require => 'email_validator/strict'

# Skip validation option
gem 'validation_skipper', github: 'karlwilbur/validation_skipper', :require => 'validation_skipper'

# Postmark email service
gem 'postmark-rails'

# Background job queue (uses Redis)
# gem 'sinatra', github: 'sinatra/sinatra', require: false # for Sidekiq web
gem 'sinatra'
gem 'sidekiq'

# Application Administration
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_importable', github: 'K-and-R/active_admin_importable'

# Authentication
gem 'devise'

# Roles
gem "rolify"

group :test do
  # Browser testing
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'poltergeist'

  # Open browser on failed integration tests
  gem 'launchy'

  # Run RSpec on file changes
  gem 'guard-rspec'

  # Clean DB for each test
  gem 'database_cleaner'

  # Provide an easier syntax for unit tests
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false

  # Code test coverage reporting
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
end

group :development, :test do
  # Dynamic app benchmarking
  gem 'derailed', require: false

  # Factory generator
  gem 'factory_girl_rails', require: false

  # A gem providing "time travel" and "time freezing" capabilities.
  gem 'timecop', require: false

  # Generate placeholder data for factories
  gem 'faker', require: false

  # RSpec for rails
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rerun', require: false
  gem 'rspec-sidekiq', require: false

  # Email preview
  gem 'letter_opener'

  # Code formatting/style Checking
  gem 'scss_lint', github: 'brigade/scss-lint', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false

  # Deploy with Capistrano (Required in text environemnt to deploy from CodeShip)
  gem 'capistrano', '>= 3.1.0', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-passenger', github: 'capistrano/passenger', require: false
  gem 'capistrano-npm', require: false
  gem 'capistrano-grunt', github: 'roots/capistrano-grunt', require: false
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq', require: false
  gem 'capistrano-maintenance', github: "capistrano/maintenance", require: false
end

group :development do
  # Generators
  gem 'nifty-generators'

  # View and CSS updates
  gem 'rack-livereload'
  gem 'guard-livereload'

  # UML ERD diagrams
  gem 'railroady'

  # Interaction with RailsPanel Chrome extension
  gem 'meta_request'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
