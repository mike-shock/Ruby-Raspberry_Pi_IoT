require_relative 'digital_sensor'

module IoT
  # TemperatureSensor - temperature sensing receptor
  class IoT::TemperatureSensor < IoT::DigitalSensor
    @temperature = 0.0

    def initialize
      @temperature = read_data
    end

    def read_data
      @temperature
    end

    def celsius
      @temperature
    end

    def fahrenheit
      @temperature * 9.0 / 5.0 + 32
    end

    def kelvin
      @temperature + 273.15
    end

    def reaumur
      @temperature * 0.8
    end

    def to_s
      sprintf "%5.2f°C", @temperature
    end

    def temperature(mode=:celsius)
      case mode
      when :celsius
        celsius
      when :fahrenheit
        fahrenheit
      when :kelvin
        kelvin
      when :reaumur
        reaumur
      else
        celsius
      end
    end
  end
end
