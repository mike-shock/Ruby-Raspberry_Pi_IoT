# IoT - Internet of Things classes and modules
module IoT

  # Logging events and  actions
  class Log
    @file_name = nil

    def initialize(file_name='/tmp/iot.log')
      @file_name = file_name
    end

    # Message types: I = Info, W = Warning, E = Error, F = Fatal error
    def message(type='I', text='OK')
      File.open(@file_name, 'w+') do |log|
        log.printf "%s %s %s\n", Time.now.strftime("%Y%m%d %H%M%S"), type, text
      end
    end
  end
end