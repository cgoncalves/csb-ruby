require 'csb/app'
require 'csb/provider'
require 'csb/user'
require 'csb/version'

module Csb
  class Client

    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
      @debug = options[:debug]
      @api_path = options[:api_path] || 'rest'
      @api_host = options[:api_host] || 'localhost:8080/csb'
    end

    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer(:secure => false), token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end

    def request_token(options={})
      consumer(:secure => false).get_request_token(options)
    end

    def authentication_request_token(options={})
      consumer(:secure => false).options[:authorize_path] = '/oauth/authenticate'
      request_token(options)
    end

    private

      def consumer(options={})
        options[:secure] ||= false
        protocol = options[:secure] ? 'https' : 'http'
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          {
            :site => "#{protocol}://#{@api_host}",
            :authorize_path => '/oauth/authorization',
            :access_token_path => '/oauth/accessToken',
            :request_token_path => '/oauth/requestToken',
            :proxy => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil
          }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end

      def get(path, headers={})
        headers.merge!("User-Agent" => "csb gem v#{Csb::Version}")
        oauth_response = access_token.get("/#{@api_path}#{path}", headers)
        parse(oauth_response.body)
      end

      def post(path, body='', headers={})
        headers.merge!("User-Agent" => "csb gem v#{Csb::Version}")
        oauth_response = access_token.post("/#{@api_path}#{path}", body, headers)
        parse(oauth_response.body)
      end

      def put(path, body='', headers={})
        headers.merge!("User-Agent" => "csb gem v#{Csb::Version}")
        oauth_response = access_token.put("/#{@api_path}#{path}", body, headers)
        parse(oauth_response.body)
      end

      def delete(path, headers={})
        headers.merge!("User-Agent" => "csb gem v#{Csb::Version}")
        oauth_response = access_token.delete("/#{@api_path}#{path}", headers)
        parse(oauth_response.body)
      end

      def parse(response_body)
        begin
          JSON.parse(response_body)
        rescue JSON::ParserError
          {:response => response_body}.to_json
        end
      end
  end
end
