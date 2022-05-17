module Delhivery
  class BaseService
    attr_reader :api_key, :is_production, :connection


    def initialize(opts={})
      @api_key = opts[:api_key] || Delhivery.configuration.api_key
      @is_production = opts[:is_production] || Delhivery.configuration.production
    end

    def connection
      @connection ||=
        Delhivery::Connection.new(
          api_key: self.api_key,
          production: self.is_production
        )  
    end

    class << self
      private

      def shared_instance
        @@_instance = self.new(
          api_key: Delhivery.configuration.api_key,
          is_production: Delhivery.configuration.production
        )
      end

      def connection
        shared_instance.connection
      end
    end
  end
end