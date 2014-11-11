require "urkel/version"
require 'net/http'
require 'urkel/configuration'
require 'urkel/connection'

module Urkel
  def self.configure
    configuration = Configuration.new
    yield configuration
    @connection = Connection.new(configuration)
  end

  def self.oops(error)
    @connection.publish(error)
  end
end
