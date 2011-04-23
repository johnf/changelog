Feature: Extract changelogs from gem or git
  In order to view the changelog
  As a changelogger
  I want extract the changelog from the source

  @vcr
  Scenario: Download rubygem
    Given the rubygem acts_as_owner with version 2.0.0 exists
    When I download the rubygem acts_as_owner with version 2.0.0
    Then the gem acts_as_owner-2.0.0.gem should exist in the ruby gem cache

  @vcr
  Scenario: Extract rubygem
    Given the rubygem acts_as_owner with version 2.0.0 exists
      And I download the rubygem acts_as_owner with version 2.0.0
    
