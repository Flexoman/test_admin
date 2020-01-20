set :stage, :production
set :rails_env, 'production'
set :branch, 'master'
set :pty, true

server('52.50.194.159',
  user: 'deploy',
  roles: %w[app db web],
  primary: true,
  ssh_options: {
    forward_agent: true,
    auth_methods: [ 'publickey' ]
  })
