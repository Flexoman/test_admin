set :stage, :staging
set :rails_env, 'production'
set :branch, 'master'
set :pty, true

server('18.203.28.115',
  user: 'deploy',
  roles: %w{web app},
  ssh_options: {
    forward_agent: true,
    auth_methods: [ 'publickey' ]
  })
