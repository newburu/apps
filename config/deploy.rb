# config valid for current version and patch releases of Capistrano
require "dotenv/load"
lock "~> 3.20.0"

set :application, ENV.fetch("APP_NAME")
set :repo_url, ENV.fetch("GIT_REPO_URL")
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ENV.fetch("DEPLOY_PATH")

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", ".env", "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads", "storage"

# Rbenv
set :rbenv_type, :user
set :rbenv_ruby, "4.0.0"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Puma config
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_enable_linger, false
set :puma_service_unit_env_vars, %w[
  RAILS_ENV=production
]
set :puma_systemctl_user, :user

# Ensure Puma is restarted after deployment
after "deploy:finished", "puma:restart"
