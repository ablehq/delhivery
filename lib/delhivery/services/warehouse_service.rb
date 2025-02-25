module Delhivery
  class WarehouseService < BaseService
    
    def create(params)
      connection.post(create_path, params)
    end

    def check_status(warehouse_name)
      connection.post(status_path, name: warehouse_name)
    end

    def edit(params)
      connection.post(edit_path, params)
    end
    
    class << self
      def create(params)
        shared_instance.create(params)
      end

      def check_status(warehouse_name)
        shared_instance.check_status(warehouse_name)
      end

      def edit(params)
        shared_instance.edit(params)
      end
      
    end
    
    private
    def create_path
      "/api/backend/clientwarehouse/create/"
    end

    def status_path
      "/api/backend/clientwarehouse/status/"
    end

    def edit_path
      "/api/backend/clientwarehouse/edit/"
    end
  end
end