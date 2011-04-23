require "bundler/capistrano"

set :application, 'changelog'
set :repository,  'git@github.com:johnf/changelog.git'

set :scm, :git
set :deploy_via, :remote_cache

set :user, 'deploy'
set :use_sudo, false

set :deploy_to, '/srv/www/rubychangelog.org'


role :app, 'beaker.inodes.org'
role :db, 'beaker.inodes.org', :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


before "deploy:setup", "db:configure"
after "deploy:update_code", "db:symlink"

namespace :db do
  desc "Create database yaml in shared path"
  task :configure do
    set :database_password do
      Capistrano::CLI.password_prompt "Database Password: "
    end

    db_config = File.read 'config/database.yml'
    db_config.gsub! /PRODUCTION_PASSWORD/, database_password

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
end
