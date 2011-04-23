Given /^I download the rubygem (\S+) with version (\S+)$/ do |name, version|
  rubygem = Rubygem.find_by_name_and_version name, version
  Languages::Ruby::Gem.fetch rubygem
end

Then /^the gem (\S+) should exist in the ruby gem cache$/ do |filename|
  File.exists?("tmp/ruby/gems/#{filename}").should be_true
end
