# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rvm"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
# require "capistrano/passenger"
# require "capistrano/puma"
# Workaround for load issue where Capistrano::Puma is not defined
# Standard require failed previously, so we use the path workaround unconditionally now.
# We expect capistrano3-puma to be installed.
puma_spec = Gem::Specification.find_by_name('capistrano3-puma')
puma_gem_path = puma_spec.full_gem_path

# Add gem lib to $LOAD_PATH so that internal requires like 'capistrano/puma/systemd' work
$LOAD_PATH.unshift(File.join(puma_gem_path, 'lib'))

require 'capistrano/puma'
install_plugin Capistrano::Puma

require 'capistrano/puma/systemd'
install_plugin Capistrano::Puma::Systemd

# Explicitly load tasks as they seem to be missing from auto-load
# Dir.glob(File.join(puma_gem_path, "lib", "capistrano", "tasks", "*.rake")).each { |r| import r }


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
