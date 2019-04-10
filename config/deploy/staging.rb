set :stage, :staging
set :branch, 'master'
# set :branch, ENV['REVISION'] || ENV['CIRCLE_BRANCH'] || ENV['BRANCH_NAME'] || fetch(:branch)

server '18.203.28.115', user: 'deploy', roles: %w{web app}
