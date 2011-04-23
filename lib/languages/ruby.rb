# TODO
# - Deal with fetch errors
# - Deal with URI.parse errors
# - Superclass the common methods

module Languages
  module Ruby
    class Gem
      def self.fetch_and_extract(rubygem)

        dep = ::Gem::Dependency.new rubygem.name, rubygem.version
        specs_and_sources = ::Gem::SpecFetcher.fetcher.fetch(dep, false, true, true)

        spec, source_uri = specs_and_sources.sort_by { |s,| s.version }.last

        path = ::Gem::RemoteFetcher.fetcher.download spec, source_uri

        target_dir = WORK_PATH + "/#{rubygem.name}-#{rubygem.version}"
        FileUtils.mkdir_p target_dir

        ::Gem::Installer.new(path, :unpack => true).unpack target_dir
      end

      def self.cache_filename(rubygem)
        CACHE_PATH + "/ruby/gems"
      end

    end

  end
end
