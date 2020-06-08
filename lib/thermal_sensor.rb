require_relative 'iot/temperature_sensor'

# ThermalSensor - Raspberry Pi internal SoC temperature sensor
module RaspberryPi
  class ThermalSensor < IoT::TemperatureSensor

    def initialize
      @name = 'Internal Thermal Zone'
      super
    end

    def read_data
      @sensor_file = '/sys/class/thermal/thermal_zone0/temp'
      File.open(@sensor_file, 'r') do |f|
        value = f.read
        @temperature = value.to_i / 1000.00
      end
      @temperature
    end
  end
end
