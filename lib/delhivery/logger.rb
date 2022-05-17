require 'logger'
module Delhivery
  class Logger
    def self.log
       @@logger ||= ::Logger.new(STDOUT)
    end  

    def self.debug(*args)
      log.debug(args)
    end
  end
end