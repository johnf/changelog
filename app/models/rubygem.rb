class Rubygem < ActiveRecord::Base
  default_scope order('id DESC')

  validate :name, :presence
  validate :version, :presence
  validate :description, :presence
  validate :gem_uri, :presence

  def has_changelog?
    status == 'attached'
  end

  def changelog_file_path
    "#{Rails.root}/public/system/changelogs/rubygem/#{self.id}"
  end

  def fetch_changelog
    Languages::Ruby::Gem.fetch_and_extract self
    changelog = Languages::Ruby::Gem.find_changelog self
    Languages::Ruby::Gem.attach_changelog self, changelog
    Languages::Ruby::Gem.cleanup self
  end

  def import_json(json)
    data = JSON.parse json
    self.name = data['name']
    self.version = data['version']
    self.description = data['info']
    self.gem_uri = data['gem_uri']
    self.source_code_uri = data['source_code_uri']
  end
end
