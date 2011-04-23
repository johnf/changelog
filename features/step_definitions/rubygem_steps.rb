Given /^the rubygem (\S+) with version (\S+) exists$/ do |name, version|
  rubygem = Rubygem.new(
    :name => name,
    :version => version,
    :gem_uri => "http://rubygems.org/gems/#{name}-#{version}.gem",
    :description => 'Foo'
  )
  rubygem.save!
end
