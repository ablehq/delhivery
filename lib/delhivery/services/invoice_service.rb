module Delhivery
  class InvoiceService < BaseService

    def generate_invoice(params)
      connection.get(path, params)
    end

    class << self
      def generate_invoice(params)
        shared_instance.generate_invoice(params)
      end
    end

    private
    def path
      "/kinko/api/invoice/charges/json/"
    end
  end
end