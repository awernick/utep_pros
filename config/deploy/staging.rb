# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
# role :app, %w{deployer@workshops.utep.edu}
# role :web, %w{deployer@workshops.utep.edu}
# role :db,  %w{deployer@workshops.utep.edu}

role :app, %w{deployer@area51.at.utep.edu}
role :web, %w{deployer@area51.at.utep.edu}
role :db,  %w{deployer@area51.at.utep.edu}

# Define server(s)
server 'area51.at.utep.edu', user: 'deployer', roles: %w{web}

set :deploy_to, "/var/www/utep_pros"
set :branch, "sso-implementation"
set :stage, :production

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'Ttnkf@g2011!',
    user: 'deployer',
}