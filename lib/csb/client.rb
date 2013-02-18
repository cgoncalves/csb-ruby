module Csb
  # Wrapper for the CSB REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://dev.csb.atnog.av.it.pt/doc the CSB API Documentation}.
  # @see http://dev.csb.atnog.av.it.pt/every_developer
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'csb/client/app'
    require 'csb/client/provider'
    require 'csb/client/user'
    require 'csb/client/service'

    alias :api_endpoint :endpoint

    include Csb::Client::App
    include Csb::Client::Provider
    include Csb::Client::User
    include Csb::Client::Service
  end
end
