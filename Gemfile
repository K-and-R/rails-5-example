source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby File.read(File.expand_path('../.ruby-version', __FILE__), mode: 'rb').chomp

gem 'rails', '~> 5.1.4'

# Configuration management (settings.yml and settings.local.yml)
gem 'choices'

# PostgreSQL
gem 'pg'

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

# Email validation
gem 'email_validator', github: 'karlwilbur/email_validator', :require => 'email_validator/strict'

# Skip validation option
gem 'validation_skipper', github: 'karlwilbur/validation_skipper', :require => 'validation_skipper'

# Postmark email service
gem 'postmark-rails'

group :development, :test do
  # Dynamic app benchmarking
  gem 'derailed', require: false

  # Factory generator
  gem 'factory_girl_rails', require: false

  # Email preview
  gem 'letter_opener'

  # Code formatting/style Checking
  gem 'scss_lint', github: 'brigade/scss-lint', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  # Generators
  gem 'nifty-generators'

  # View and CSS updates
  gem 'rack-livereload'
  gem 'guard-livereload'

  # UML ERD diagrams
  gem 'railroady'

  # bullet for performance, checking for n+1 queries
  gem 'bullet'

  # Interaction with RailsPanel Chrome extension
  gem 'meta_request'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
