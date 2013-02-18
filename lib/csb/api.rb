require 'csb/connection'
require 'csb/request'
require 'csb/authentication'

module Csb
  # @private
  class API
    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Csb.options.merge(options)

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def endpoint
      #"https://#{self.subdomain}.csb.com/api/#{self.version}/"
      "http://localhost:8080/csb/rest/"
    end

    include Connection
    include Request
    include Authentication
  end
end
