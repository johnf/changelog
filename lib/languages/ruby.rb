# TODO
# - Deal with fetch errors
# - Deal with URI.parse errors
# - Superclass the common methods
WORK_PATH = "#{Rails.root}/tmp/extracted/"

CHANGELOG_NAME_REGEX = %r{^(changes|changelog|history)(\.(md|markdown|rdoc|txt))?$}i


module Languages
  module Ruby
    class Gem
      def self.fetch_and_extract(rubygem)

        spec = ::Gem::Specification.new rubygem.name, rubygem.version

        path = ::Gem::RemoteFetcher.fetcher.download spec, 'http://rubygems.org'

        target_dir = work_dir rubygem
        FileUtils.mkdir_p target_dir

        ::Gem::Installer.new(path, :unpack => true).unpack target_dir
      end

      def self.find_changelog(rubygem)
        dirs = Dir.glob "#{work_dir rubygem}/*"
        dirs.map! {|f| File.basename f}
        dirs = dirs.select { |f| f =~ CHANGELOG_NAME_REGEX }
        if dirs.size > 1
          rubygem.status = 'multiple'
          rubygem.save!
          return
        end

        dirs.first
      end

      def self.attach_changelog(rubygem, changelog)
        if changelog.nil? and rubygem.status == 'new'
          rubygem.status = 'missing'
        else
          FileUtils.cp "#{work_dir rubygem}/#{changelog}", rubygem.changelog_file_path
          rubygem.status = 'attached'
        end
        rubygem.save!
      end

      def self.work_dir(rubygem)
        WORK_PATH + "/ruby/gems/#{rubygem.name}-#{rubygem.version}"
      end

    end

  end
end
