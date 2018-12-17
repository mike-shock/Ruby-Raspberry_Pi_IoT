require 'temperature_sensor'

# DS18B20 - high precision temperature sensor with 1-wire interface
class DS18B20 < TemperatureSensor

  def initialize(device='w1_slave')
    self.name = 'DS18B20'
    @sensor_file = DigitalReceptor.one_wire_file('28*', device)
    if @sensor_file
      @temperature = read_data
    else
      raise "#{self.name} - Sensor NOT FOUND!"
    end
  end

  def read_data
    File.open(@sensor_file, 'r') do |f|
      value = f.read
      @temperature = value.scan(/t=(\d+)/).flatten[0].to_i/1000.0
    end
    @temperature
  end
end

