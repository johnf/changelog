Feature: Users have accounts
  In order to get my changelogs
  As a user
  I want to create an account and login

  Scenario: Creating a new account
    Given I am logged out
    When I register an account for johnf@inodes.org with handle johnf
     And I confirm the account for johnf@inodes.org
   Given I am logged out
     And I log in as johnf@inodes.org
    Then I should be logged in as johnf

  @production
  Scenario: Only admin users can see the admin data
    Given I register and confirm an account for johnf@inodes.org with handle johnf
    When I go to the admin data root page
    Then I should see "not authorized"

  @production
  Scenario: Only admin users can see delayed_job_admin
    Given I register and confirm an account for johnf@inodes.org with handle johnf
    When I go to the delayed job admin page
    Then I should see "not authorized"


  # TODO Add more features to test all elements of devise we care about.

