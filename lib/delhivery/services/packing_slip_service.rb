module Delhivery
  class PackingSlipService < BaseService
    def generate_slip(*waybill_numbers)
      connection.get(path, wbns: waybill_numbers.join(','))
    end
    
    class << self
      def generate_slip(*waybill_numbers)
        shared_instance.generate_slip(waybill_numbers)
      end
    end
    
    private
    def path
      "/api/p/packing_slip"
    end
  end
end