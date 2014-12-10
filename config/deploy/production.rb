# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{deployer@workshops.utep.edu}
role :web, %w{deployer@workshops.utep.edu}
role :db,  %w{deployer@workshops.utep.edu}

# Define server(s)
server 'workshops.utep.edu', user: 'deployer', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'Ttnkf@g2011!',
    user: 'deployer',
}