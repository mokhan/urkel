module Urkel
  class InvalidAPITokenError < StandardError; end

  class Connection
    API_ENDPOINT="/api/v1/failures"

    def initialize(configuration)
      @configuration = configuration
    end

    def publish(error)
      response = @configuration.request(request_for(error))
      response.is_a?(Net::HTTPOK)
    end

    def publish!(error)
      response = @configuration.request(request_for(error))
      if response.is_a? Net::HTTPOK
        true
      elsif response.is_a? Net::HTTPUnauthorized
        raise InvalidAPITokenError.new
      else
        false
      end
    end

    private

    def request_for(error)
      Net::HTTP::Post.new(API_ENDPOINT).tap do |request|
        request.set_form_data(form_payload_for(error))
      end
    end

    def form_payload_for(error)
      {
        "error[message]" => error.message,
        "error[hostname]" => Socket.gethostname,
        "error[error_type]" => error.class.name,
        "error[backtrace]" => error.backtrace,
      }
    end
  end
end
