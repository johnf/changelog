class Rubygem < ActiveRecord::Base
  validate :name, :presence
  validate :version, :presence
  validate :description, :presence
  validate :gem_uri, :presence

  def changelog_file_path
    "#{Rails.root}/public/changelogs/rubygem/#{self.id}"
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
