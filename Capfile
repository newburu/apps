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
if Gem.loaded_specs['capistrano3-puma']
  puma_gem_path = Gem.loaded_specs['capistrano3-puma'].full_gem_path
  require File.join(puma_gem_path, 'lib', 'capistrano', 'puma.rb')
  install_plugin Capistrano::Puma
  # Explicitly load tasks as they seem to be missing from auto-load
  Dir.glob(File.join(puma_gem_path, "lib", "capistrano", "tasks", "*.rake")).each { |r| import r }
end


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
