module Delhivery
  class WayBillService < BaseService
    def bulk_fetch(count=1)
      connection.get(path('bulk'), { count: count } )
    end

    def fetch
      connection.get(path('fetch'))
    end

    class << self
      def bulk_fetch(count=1)
        shared_instance.bulk_fetch(count)
      end
  
      def fetch
        shared_instance.fetch
      end
    end

    private
    def path(action)
      "/waybill/api/#{action}/json/"
    end
  end
end
