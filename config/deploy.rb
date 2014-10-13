set :application,	"labrador"

require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_type,              :system
set :rvm_ruby_string,       "ruby-2.0.0"
set :rvm_path,              "/usr/local/rvm"


set :scm,			:git
set :repository,	"git@github.com:preston/#{application}.git"
set :deploy_to,		"/var/www/#{application}"
set :deploy_env,	'production'


role :web, "ventures.prestonlee.com"
role :app, "ventures.prestonlee.com"
role :db,  "ventures.prestonlee.com", :primary => true

after "deploy", "deploy:migrate"
after "deploy:migrate", 'deploy:cleanup'
before "deploy:assets:precompile", "config:update"

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }



# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end



namespace :config do
 
  desc "Add server-only shared directories."
  task :setup, :roles => [:app] do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/db"
    run "mkdir -p #{shared_path}/public/data"
  end
  after "deploy:setup", "config:setup"
  
  desc "Update server-only config files and symlinks in the new deployment directory."
  task :update, :roles => [:app] do
  	run "cp -Rfv #{shared_path}/config #{release_path}"
    run "cp -Rfv #{shared_path}/public/data #{release_path}/public/"
  end
  after "deploy:update_code", "config:update"
 
  # desc "Update shared server database symlink for new deployment."
  # task :database, :roles => [:app] do
  #   run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  # end
  # after "deploy:update_code", "config:update"

end