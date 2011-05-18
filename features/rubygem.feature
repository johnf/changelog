Feature: Rubygems have pages
  In order to find information about gems
  As a users
  I want to got to the rubygem's page

  @vcr
  @wip
  Scenario: Vist a rubygem's page
    Given the rubygem database_cleaner with version 0.6.6 exists
      And the rubygem database_cleaner with version 0.6.7.RC exists
      And the rubygem database_cleaner with version 0.6.7 exists
      And I fetch the changelog for the rubygem database_cleaner with version 0.6.6
      And I fetch the changelog for the rubygem database_cleaner with version 0.6.7.RC
      And I fetch the changelog for the rubygem database_cleaner with version 0.6.7
     When I go to the database_cleaner rubygem page
     Then I should see "database_cleaner" within ".name"
      And I should see "0.6.6" within ".versions"
      And I should see "0.6.7" within ".versions"


