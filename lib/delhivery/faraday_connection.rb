require 'faraday_middleware'
require 'delhivery/faraday/raise_http_errors'
require 'logger'
require 'null_logger'
module Delhivery
  class FaradayConnection  
    def self.connection(is_prod)
      base_url = is_prod ? "https://track.delhivery.com/" : "https://staging-express.delhivery.com/"
      connection = ::Faraday.new(base_url) do |conn|
        conn.response :logger, @logger, bodies: true
        conn.request :json
        conn.request :url_encoded
        conn.response :mashify
        conn.response :json, :content_type => /\bjson$/
        conn.use Delhivery::Faraday::Response::RaiseHttpError
        conn.adapter ::Faraday.default_adapter
      end
    end

    def self.shared_staging
      @@_shared_staging ||= connection(false)
    end

    def self.shared_production
      @@_shared_staging ||= connection(true)
    end
  end
end