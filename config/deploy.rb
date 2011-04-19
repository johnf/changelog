require "bundler/capistrano"

set :application, 'changelog'
set :repository,  'git@github.com:johnf/changelog.git'

set :scm, :git
set :deploy_via, :remote_cache

set :user, 'deploy'
set :use_sudo, false

set :deploy_to, '/srv/www/rubychangelog.org'


role :app, 'beaker.inodes.org'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
