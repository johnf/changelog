When /^I fire the rubygems webook for rails$/ do
  body = <<-END
    {
      "name": "rails",
      "dependencies": {
        "runtime": [
          {
            "name":"bundler",
            "requirements":"~> 1.0"
          },
          {
            "name":"railties",
            "requirements":"= 3.0.7"
          },
          {
           "name":"actionmailer",
           "requirements":"= 3.0.7"
          },
          {
            "name":"activeresource",
            "requirements":"= 3.0.7"
          },
          {
            "name":"activerecord",
            "requirements":"= 3.0.7"
          },
          {
            "name":"actionpack",
            "requirements":"= 3.0.7"
          },
          {
            "name":"activesupport",
            "requirements":"= 3.0.7"
          }
        ],
        "development":[]
      },
      "downloads": 3527193,
      "info": "Ruby on Rails is a full-stack web framework",
      "version":"3.0.7",
      "version_downloads":4979,
      "homepage_uri":"http://www.rubyonrails.org",
      "authors":"David Heinemeier Hansson",
      "project_uri":"http://rubygems.org/gems/rails",
      "gem_uri":"http://rubygems.org/gems/rails-3.0.7.gem",
      "source_code_uri":"http://github.com/rails/rails",
      "bug_tracker_uri":"http://rails.lighthouseapp.com/projects/8994-ruby-on-rails",
      "wiki_uri":"http://wiki.rubyonrails.org",
      "documentation_uri":"http://api.rubyonrails.org",
      "mailing_list_uri":"http://groups.google.com/group/rubyonrails-talk"
    }
  END
  path = path_to('the hook rubygems page') + '.json'
  post path, body
end

Then /^one rubygem record should exist with:$/ do |table|
  Rubygem.count.should == 1

  rubygems = Rubygem.first
  table.hashes.each do |hash|
    rubygems.send(hash['field']).should == hash['value']
  end
end
