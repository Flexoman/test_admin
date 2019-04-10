# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "hiro_admin"

# set :format,                      :pretty
##############
##   Base   ##
##############
set :repo_url, 'git@github.com:Flexoman/test_admin.git'
set :deploy_user, 'deploy'
set :user, ENV['CAP_USER'] || fetch(:deploy_user)

set :pty, true
set :ssh_options, {
  forward_agent: true,
  auth_methods: [ 'publickey' ]
}

# append :linked_files, 'config/database.yml', 'config/secrets.yml'
set :linked_files, %w{.env}
append :linked_dirs, 'tmp/pids', 'tmp/cache', 'tmp/sockets'

set :deploy_to, "/home/#{fetch(:deploy_user)}/hiro/#{fetch(:application)}"
##############

#################
##   Bundler   ##
#################
set :bundle_jobs, 4
set :bundle_gemfile, -> { release_path.join('Gemfile') }
#################
set :bundle_flags, "--quiet"

#############
##   RVM   ##
#############
set :rvm_type, :system
set :rvm_ruby_version, '2.5.1'
#############

###############
##   Rails   ##
###############
set :migration_role, :app
set :conditionally_migrate, true
###############

