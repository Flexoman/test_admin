# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/puma'
require "capistrano/rvm"
require "capistrano/bundler"
require "capistrano/rails/assets"
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Jungle

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
