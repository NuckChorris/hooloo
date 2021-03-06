require 'uri'
require 'open-uri'
require 'multi_json'

class Hooloo
  class << self
    def auto_cast(obj)
      # TODO: Automatically cast an object received from Mozart into the corresponding Ruby Class
    end
    def hulu_uri
      URI("http://www.hulu.com/")
    end
    def api_uri
      hulu_uri + '/mozart/v1.h2o/'
    end
    def request_uri(path, query={})
      uri = api_uri + path
      uri.query = URI.encode_www_form({
        access_token: tokens["API"]
      }.merge(query))
      uri
    end
    def request(*args)
      # TODO: check if we get 403'd and request a new token
      MultiJson.load open(request_uri(*args)).read
    end
    def paginated_request(path, args={}, page_size=70, &block)
      # TODO: cache responses
      Enumerator.new do |g|
        loop.with_index do |_, i|
          response = request(path, {
            items_per_page: page_size,
            position: i * page_size
          }.merge(args))['data']
          response.each { |x| block.call(g, x) }
          break if response.length < page_size
        end
      end
    end
    def tokens
      @tokens or begin
        @tokens = Hash[open(hulu_uri).read.scan(/([A-Z]+)_DONUT = '([a-zA-Z0-9\-_\/]+)';$/)]
      end
    end
    def tokens!
      @tokens = nil
      tokens
    end
  end
end
