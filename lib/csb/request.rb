module Csb
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false)
      request(:get, path, options, nil, raw)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false)
      request(:post, path, options, nil, raw)
    end

    def post(path, body, content_type="application/#{format}", raw=false)
      request(:post, path, {'content-type' => content_type}, body, raw)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, raw=false)
      request(:put, path, options, nil, raw)
    end

    def put(path, body, content_type="application/#{format}", raw=false)
      request(:put, path, {'content-type' => content_type}, body, raw)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false)
      request(:delete, path, options, nil, raw)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, body=nil, raw=false)
      response = connection(raw).send(method) do |request|
        case method
        when :get, :delete
          request.url(formatted_path(path), options)
        when :post, :put
          request.path = formatted_path(path)
          if body
            request.headers['content-type'] = options['content-type']
          else
            request.body = options unless options.empty?
          end
        end
      end
      raw ? response : response.body
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end
