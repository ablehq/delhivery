module Delhivery
  class PinCodeService < BaseService
    def filter(*pin_codes)
      connection.get(path, filter_codes: pin_codes.join(','))
    end
    
    def active_after(date)
      connection.get(path, dt: date.strftime("%Y-%m-%d"))
    end
    
    def for_state(state_code)
      connection.get(path, st: state_code)
    end
    class << self
      def filter(*pin_codes)
        shared_instance.filter(pin_codes)
      end
      
      def active_after(date)
        shared_instance.active_after(date)
      end
      
      def for_state(state_code)
        shared_instance.for_state(state_code)
      end
    end
    
    private
    def path
      "/c/api/pin-codes/json/"
    end
  end
end