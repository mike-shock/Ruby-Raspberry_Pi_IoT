require 'i2c/backends/i2c-dev.rb'
require 'i2c/bme280'
require_relative 'humiture_sensor'

module IoT
  # Bosch BMP/BME humidity, temperature & atmospheric pressure sensor family
  class BMxSensor < IoT::HumitureSensor

    def initialize(sensor_name='BMx280', bus=1)
      @sensor_name = sensor_name

      device = I2C::Dev.create("/dev/i2c-#{bus}")
      @sensor = I2C::Driver::BME280.new(device: device)
      @temperature, @humidity, @pressure = read_data
    end

    def read_data
      data = @sensor.all
      @temperature = data[:t]
      @pressure = data[:p]
      @humidity = data[:h]
      [@temperature, @humidity, @pressure]
    end

    def name
      @sensor_name
    end

    # standard atmospheric pressure @ sea level = 1.01325 bar = 1013.25 mbar = 101.325 kPa
    def hPa
      @pressure
    end

    def pressure(mode=:hPa)
      case mode
      when :hPa       # 1 hPa = 100 Pa = 1 mbar = 1 hPa = 0.750062 mmHg [@ 0°C]
        hPa
      when :kPa       # 1 kPa = 1000 Pa = 10 hPa
        hPa / 10.0
      when :Pa        # 1 Pa = 0.01 hPa = 0.001 kPa
        hPa * 100.0
      when :mmHg      # 1 mmHg = 1.3332236842105263 hPa = 133.322387415 Pa = 1.000000142466321... Torr
        hPa / (1013.25 / 760) # 760 mmHg = 101.3250144354 kPa
      when :atm       # 1 atm = 101325 Pa = 101.325 kPa
        hPa / 1013.25
      when :bar       # 1 bar ≡ 100000 Pa = 1000 hPa = 0.987 atm = 750.06 mmHg = 750.06 Torr
        hPa / 1000.0
      when :mbar      # 1 mbar = 0.001 bar
        bar * 1000.0
      when :Torr      # 1 Torr = 1/760 atm = 101325/760 Pa = 0.999999857533699... mmHg
        (hPa / 1013.25) / 760
      else
        hPa
      end
    end

    def to_s
      sprintf "%5.2f°C, %5.2f %%, %5.2f mmHg", @temperature, @humidity, pressure(:mmHg)
    end
  end

  class BMP280 < IoT::BMxSensor # combined atmospheric pressure & temperature sensor
    def initialize
      super('BMP280')
    end
  end

  class BME280 < IoT::BMxSensor # combined atmospheric pressure, temperature & humidity sensor
    def initialize
      super('BME280')
    end
  end
end