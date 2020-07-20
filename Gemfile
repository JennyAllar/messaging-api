source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'puma', '~> 4.1'
gem 'pg'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'
gem "rswag-specs"
gem 'simplecov-small-badge', :require => false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  %w[rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master' # Previously '4-0-dev' or '4-0-maintenance' branch
  end
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 4.0'
end

group :production, :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

group :test do
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
