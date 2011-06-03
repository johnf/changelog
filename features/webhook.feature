Feature: Process rubygems webhooks
  In order to gather information about rubygems
  As a changlogger
  I want to enable a webhook


  Scenario: Hit rubygems webhook
    When I fire the rubygems webook for rails
    Then one rubygem record should exist with:
        | field           | value |
        | name            | rails |
        | version         | 3.0.7 |
        | description     | Ruby on Rails is a full-stack web framework |
        | gem_uri         | http://rubygems.org/gems/rails-3.0.7.gem |
        | source_code_uri | http://github.com/rails/rails |
    When the jobs are dispatched
     And I go to the rails rubygem page
    Then I should see "3.0.7" within ".versions"
     And I should see "Changelog" within "#version-3_0_7"
