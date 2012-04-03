source 'http://rubygems.org'

gem 'rake', "0.8.7"
gem 'rails', '3.1.0'
gem 'texticle', "2.0", :require => 'texticle/rails'

group :development do
  gem 'pg'  
end

group :production do
  gem 'pg'
  gem 'dalli'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'redcarpet', '< 2.0' # Markdown

# Users
gem 'devise'

# AWS Integration
gem 'aws-sdk'
gem 'aws-s3', :require => 'aws/s3'
gem 'paperclip', '~> 2.4'
