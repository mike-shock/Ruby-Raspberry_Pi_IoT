require 'receptor'

# DigitalReceptor - receptor with digitized values
class DigitalReceptor < Receptor
  @@one_wire_bus = '/sys/bus/w1/devices'
  @sensor_file = nil

  def self.one_wire_file(prefix='28*', device='w1_slave')
    files = Dir[@@one_wire_bus+'/'+prefix]
    if files.size > 0 then
      @sensor_file = files[0]+'/'+device
    end
    @sensor_file
  end

end
