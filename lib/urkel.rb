require "urkel/version"
require 'net/http'
require 'urkel/configuration'
require 'urkel/connection'

module Urkel
  class InvalidConfigurationError < StandardError; end
  class InvalidAPITokenError < StandardError; end

  def self.configure
    configuration = Configuration.new
    yield configuration
    @connection = Connection.new(configuration)
  end

  def self.oops(error)
    raise InvalidConfigurationError.new unless @connection
    @connection.publish(error)
  end

  def self.reset
    @connection = nil
  end
end
