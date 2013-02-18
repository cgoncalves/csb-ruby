require 'csb/error'
require 'csb/configuration'
require 'csb/api'
require 'csb/client'

module Csb
  extend Configuration

  # Alias for Csb::Client.new
  #
  # @return [Csb::Client]
  def self.client(options={})
    Csb::Client.new(options)
  end

  # Delegate to Csb::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method)
    client.respond_to?(method) || super
  end
end
