source 'https://rubygems.org'

gem 'rails', '~>4.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'ejs' # For javascript JST templates
gem 'uglifier', '>= 1.3.0' # Compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'therubyracer', :platforms => :ruby # See JS runtimes
gem 'jquery-rails'

# Generators
gem 'rabl' # JSON API building

# Use Capistrano for deployment
group :development do
  gem 'capistrano'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails' # Specs in both development and test for generators
  gem 'factory_girl_rails' # Factories instead of mocks

  gem 'thin' # Development server
end

group :test do
  gem 'rspec-default-params'
  gem 'shoulda-matchers' # Rails specific matchers
  gem 'faker' # Fake data
  gem 'jasmine-rails' # JS tests
end
