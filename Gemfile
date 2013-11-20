source 'https://rubygems.org'

gem 'rails', '~>4.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'ejs' # For javascript JST templates
gem 'uglifier', '>= 1.3.0' # Compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'
gem 'less-rails'
gem 'less-rails-bootstrap'
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
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # Factories instead of mocks
  gem 'faker' # Fake data
  gem 'jasmine' # JS tests
end
