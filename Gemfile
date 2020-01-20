source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.5.1'

gem 'activeadmin'
gem 'devise'
gem 'cancancan'
gem 'draper'
gem 'pundit'

gem 'rails', '~> 5.1.6'
gem 'pg'
gem 'mongoid'
gem 'puma', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'dotenv-rails', '~> 2.2.1'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'dotenv-rails', '~> 2.2.1'
# gem 'arbre-1.2.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem "capistrano", "~> 3.11", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
