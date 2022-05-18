require 'faraday_middleware'
require 'delhivery/faraday/raise_http_errors'
require 'delhivery/faraday_connection'
require 'delhivery/logger'
require 'logger'
require 'null_logger'

module Delhivery
  class Connection    
    def initialize(opts)
      @token = opts[:api_key]
      @connection = opts[:production] ? Delhivery::FaradayConnection.shared_production : FaradayConnection.shared_staging
    end

    def get(route, params={}, headers={})
      params = params.delete_if {|key, value| value.nil? }
      run_request(:get, build_url(route, params), nil, headers)
    end

    def build_url(route, params)
      @connection.build_url(route, params)
    end

    def post(route, body=nil, headers={})
      run_request(:post, route, body, headers)
    end

    def put(route, body=nil, headers={})
      run_request(:put, route, body, headers)
    end

    def delete(route, body=nil, headers={})
      run_request(:delete, route, body, headers)
    end

    def run_request(method, route, body, headers)
      default_headers = { 'Authorization' => "Token #{@token}", 'Accept' => 'application/json', 'Content-Type': 'application/json'}.freeze
      response = {}
        response = @connection.run_request(
          method,
          route,
          body,
          default_headers.merge(headers)
        )
      Delhivery::Logger.debug(response.body)
      response
    end
  end
end
