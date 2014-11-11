module Urkel
  class Configuration
    attr_accessor :api_host, :api_key

    def initialize(api_host = '', api_key = '')
      @api_host = api_host
      @api_key = api_key
    end

    def request(request)
      request['authorization'] = "Token token=#{api_key}"
      http_connection.request(request)
    end

    private

    def http_connection
      uri = URI.parse(api_host)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == "https")
      http
    end
  end
end
