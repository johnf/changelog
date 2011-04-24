Given /^I download the rubygem (\S+) with version (\S+)$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  Languages::Ruby::Gem.fetch_and_extract rubygem
end

Then /^the gem directory (\S+) should exist with file (\S+)$/ do |dir, filename|
  File.exists?("tmp/extracted/#{dir}").should be_true
  File.exists?("tmp/extracted/#{dir}/#{filename}").should be_true
end

Given /^I find the changelog for rubygem (\S+) with version (\S+)$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  @changelog = Languages::Ruby::Gem.find_changelog rubygem
end

Then /^the changelog should be (\S+)$/ do |filename|
  @changelog.should == filename
end


When /^I attach the changelog to the rubygem (\S+) with version (\S+)$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  Languages::Ruby::Gem.attach_changelog rubygem, @changelog
end

Then /^the rubygem (\S+) with version (\S+) should have status (\S+)$/ do |name, version, status|
  rubygem = Rubygem.find_by_name_and_version name, version
  rubygem.status.should == status
end

Then /^the rubygem (\S+) with version (\S+) should have a changelog$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  File.exists?(rubygem.changelog_file_path).should == true
end
