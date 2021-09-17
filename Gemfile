source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'rexml', '~> 3.2', '>= 3.2.4'
gem 'bootstrap', '~> 4.6' # for bootstrap 4
# gem 'bootstrap', '~> 5.0.0.beta2'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7' # for font awesome 4
gem 'bootstrap_form', '~> 4.5' # for bootstrap form
gem 'devise', '~> 4.7', '>= 4.7.3' # for authentication
gem 'gravatar_image_tag', '~> 1.2' # for gravatar image
gem 'redcarpet', '~> 3.5', '>= 3.5.1' # for markdown
gem 'kramdown', '~> 2.3', '>= 2.3.1' # for kramdown
gem 'rouge', '~> 3.26' # for ruby syntax highligting
gem 'rolify', '~> 5.3' # for roles
gem 'pg_search', '~> 2.3', '>= 2.3.5' # for pg search
gem 'recaptcha', '~> 5.7' # prevent bots
gem 'figaro', '~> 1.2' # for hiding my secret credentials
# gem 'aws-sdk-s3', '~> 1.94', '>= 1.94.1', require: false
gem 'aws-sdk-s3', '~> 1'
gem 'redis', '~> 4.0'
gem 'image_processing', '~> 1.2'
gem 'mini_magick', '~> 4.11'
gem 'rmagick', '~> 4.2', '>= 4.2.2'
gem 'active_storage_validations', '~> 0.9.3'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'factory_bot_rails', '~> 6.1'
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'webdrivers', '~> 4.6'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
