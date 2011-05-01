Feature: Extract changelogs from gem or git
  In order to view the changelog
  As a changelogger
  I want extract the changelog from the source

  @vcr
  Scenario: Download, extract and attach a rubygem changelog
    Given the rubygem database_cleaner with version 0.6.7.RC exists

    When I download the rubygem database_cleaner with version 0.6.7.RC
    Then the gem directory database_cleaner-0.6.7.RC should exist with file History.txt

    When I find the changelog for rubygem database_cleaner with version 0.6.7.RC
    Then the changelog should be History.txt

    When I attach the changelog to the rubygem database_cleaner with version 0.6.7.RC
    Then the rubygem database_cleaner with version 0.6.7.RC should have status attached
     And the rubygem database_cleaner with version 0.6.7.RC should have a changelog

    When I fetch the changelog for the rubygem database_cleaner with version 0.6.7.RC
    Then the rubygem database_cleaner with version 0.6.7.RC should have status attached
     And the rubygem database_cleaner with version 0.6.7.RC should have a changelog
