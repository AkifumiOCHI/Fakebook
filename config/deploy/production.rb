server '52.196.192.91', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/ochiakifumi/.ssh/id_rsa'
