source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3', '< 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
gem 'terser', '~> 1.1', '>= 1.1.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# tava tendo problemas com essa gem e assim foi!
gem 'ransack', github: 'activerecord-hackery/ransack', branch: '8daa87a0389d380f7c9fd7ea9cb5bda634d5dc7d'

gem 'devise'
gem 'bootsnap', '~> 1.1', '>= 1.1.7'
gem 'activesupport', '~> 5.2'
gem 'rails-i18n', '~> 5.1'
gem 'tty-spinner'
gem 'faker', '~> 2.15', '>= 2.15.1'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'kaminari-i18n'
gem 'cocoon', '~> 1.2', '>= 1.2.15'
gem "paperclip", "~> 6.0.0"
gem 'imagemagick-identify', '~> 0.0.1'
gem 'prawn-rails'
gem 'redis'
gem 'hiredis'
gem 'trix'
gem 'searchkick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rails_db', '2.2.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem "capistrano", "~> 3.14", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem 'capistrano-rvm'
  gem 'capistrano-bundler', '~> 2.0'
  gem "capistrano3-unicorn"
end

group :production do
  gem 'mysql2', '~> 0.5.3'
  gem "unicorn"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
