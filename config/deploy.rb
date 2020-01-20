# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "active_admin"
set :repo_url, 'git@github.com:Flexoman/test_admin.git'

set :linked_files, %w{.env}
append :linked_dirs, 'tmp/pids', 'tmp/cache', 'tmp/sockets'

set :deploy_user, 'deploy'
set :deploy_to, "/home/#{fetch(:deploy_user)}/hiro/#{fetch(:application)}"

set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'

set :assets_roles, [:web, :app]
set :rake_roles, [:web, :db, :app]

set :puma_user, fetch(:deploy_user)
set :puma_conf, "#{shared_path}/puma.rb"