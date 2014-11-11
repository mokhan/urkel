module Urkel
  class Configuration
    attr_reader :uri, :api_key

    def initialize(api_host, api_key)
      @uri = URI.parse(api_host)
      @api_key = api_key
    end

    def request(request)
      request['authorization'] = "Token token=#{api_key}"
      http_connection.request(request)
    end

    private

    def http_connection
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == "https")
      http
    end
  end
end
