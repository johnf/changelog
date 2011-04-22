PASSWORD = 'secret123'

Given /^I am logged out$/ do
  visit('/users/sign_out')
  Then %{I should see "Sign in"}
end

When /^I log in as (\S+)$/ do |email|
  visit new_user_session_path

  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => PASSWORD

  click_button 'Sign in'

  page.should have_content('Signed in successfully')
end

When /^I register an account for (\S+) with handle (\S+)$/ do |email, handle|
  Given %{no emails have been sent}
  visit new_user_registration_path
  fill_in 'user_email', :with => email
  fill_in 'user_handle', :with => handle
  fill_in 'user_password', :with => PASSWORD
  fill_in 'user_password_confirmation', :with => PASSWORD
  click_on 'Sign up'
  page.should have_content('You have signed up successfully. However, we could not sign you in because your account is unconfirmed')
end

When /^I confirm the account for (\S+)$/ do |email|
  # TODO should we use the more caybara type steps?
  Then %{"#{email}" should receive an email}
  When %{I open the email}
  Then %{I should see "confirm" in the email body}
  When %{I follow "confirm" in the email}
  page.should have_content('Your account was successfully confirmed. You are now signed in.')
end

Then /^I should be logged in as (\S+)/ do |handle|
  page.should have_content("logged in as #{handle}")
end

When /^I register and confirm an account for (\S+) with handle (\S+)/ do |email, handle|
  When %{I register an account for #{email} with handle #{handle}}
  When %{I confirm the account for #{email}}
end
