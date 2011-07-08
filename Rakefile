#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Changelog::Application.load_tasks

namespace :hook do

  namespace :rubygems do

    desc 'List webhooks'
    task :list, :api_token do |t, args|
      puts `curl -s -H 'Authorization:#{args[:api_token]}' http://rubygems.org/api/v1/web_hooks.json`
    end

    desc "Set up rubygems web hook"
    task :add, :api_token, :url do |t, args|
      p args
      puts `curl -s -H 'Authorization:#{args[:api_token]}' -F 'gem_name=*' -F 'url=#{args[:url]}' http://rubygems.org/api/v1/web_hooks`
    end

    desc "Remove rubygems web hook"
    task :remove, :api_token, :url do |t, args|
      puts `curl -s -X DELETE -H 'Authorization:#{args[:api_token]}' -F 'gem_name=*' -F 'url=#{args[:url]}' http://rubygems.org/api/v1/web_hooks/remove`
    end
  end
end
