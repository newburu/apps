server ENV.fetch('DEPLOY_SERVER_IP'), user: ENV.fetch('DEPLOY_USER'), roles: %w{app db web}

# Custom SSH Options
# set :ssh_options, {
#   keys: %w(/home/rlisowski/.ssh/id_rsa),
#   forward_agent: false,
#   auth_methods: %w(publickey password)
# }
