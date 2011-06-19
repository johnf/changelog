module ApplicationHelper
  def changelog_path(object)
    compute_public_path "#{object.class.to_s.downcase}/#{object.id}", 'system/changelogs'
  end
end
