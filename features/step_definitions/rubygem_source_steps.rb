Given /^I download the rubygem (\S+) with version (\S+)$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  Languages::Ruby::Gem.fetch_and_extract rubygem
end

Then /^the gem directory (\S+) should exist with file (\S+)$/ do |dir, filename|
  File.exists?("tmp/extracted/#{dir}").should be_true
  File.exists?("tmp/extracted/#{dir}/#{filename}").should be_true
end
