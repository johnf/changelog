Feature: Extract changelogs from gem or git
  In order to view the changelog
  As a changelogger
  I want extract the changelog from the source

  @vcr
  Scenario: Download and extract rubygem
    Given the rubygem database_cleaner with version 0.6.7.RC exists
    When I download the rubygem database_cleaner with version 0.6.7.RC
    Then the gem directory database_cleaner-0.6.7.RC should exist with file History.txt

