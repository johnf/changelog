require 'net/http'

# TODO
# - Deal with http errors
# - Deal with URI.parse errors
# - Superclass the common methods

module Languages
  module Ruby
    class Gem
      def self.fetch(rubygem)

        uri = URI.parse rubygem.gem_uri

        Net::HTTP.start(uri.host, uri.port) do |http|
          output = open cache_filename(rubygem), 'wb'
          begin
            http.request_get('/sample.flv') do |response|
              response.read_body do |segment|
                output.write segment
              end
            end
          ensure
            output.close
          end
        end

        cache_filename(rubygem)
      end

      def self.cache_filename(rubygem)
        # TODO sanitize filename
        CACHE_PATH + "/ruby/gems/#{rubygem.name}-#{rubygem.version}.gem"
      end

    end

  end
end
