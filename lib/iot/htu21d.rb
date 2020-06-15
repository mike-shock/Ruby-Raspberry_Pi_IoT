require 'i2c/i2c'
require_relative 'humiture_sensor'

module IoT
  # HTU21D - relative humidity and temperature digital senspr
  class HTU21D  < IoT::HumitureSensor # inspired by https://github.com/leon-anavi/rpi-examples/HTU21D
    I2C_ADDR = 0x40
    CMD_TRIG_TEMP_HM = 0xE3
    CMD_TRIG_HUMID_HM = 0xE5
    CMD_TRIG_TEMP_NHM = 0xF3
    CMD_TRIG_HUMID_NHM = 0xF5
    CMD_WRITE_USER_REG = 0xE6
    CMD_READ_USER_REG = 0xE7
    CMD_RESET = 0xFE

    def initialize(device_address=I2C_ADDR, bus_number=1)
      @sensor_name = 'HTU21D'
      @device_address = device_address

      @buffer_size = 3
      @device = ::I2C.create("/dev/i2c-#{bus_number}")
      @device.write(I2C_ADDR, CMD_RESET)
      @temperature, @humidity = read_data
    end


    # Read values by 'DhtSensor.read' from 'dht-sensor-ffi'
    def read_data
      @temperature = t
      @humidity = h
      [@temperature, @humidity]
    end

    def name
      @sensor_name
    end
private
    def t
      @device.write(I2C_ADDR, CMD_TRIG_TEMP_NHM)
      delay 100
      buffer = @device.read(I2C_ADDR, @buffer_size)
#      STDERR.printf "%s\n", buffer.each_byte.map { |b| b.to_s(16) }.join
      raw = (buffer[0].ord << 8 | buffer[1].ord) & 0xFFFC
      value = raw / 65536.0
      @temperature = -46.85 + (175.72 * value) # See page 14 of the datasheet
    end

    def h
      @device.write(I2C_ADDR, CMD_TRIG_HUMID_NHM)
      delay 100
      buffer = @device.read(I2C_ADDR, @buffer_size)
#      STDERR.printf "%s\n", buffer.each_byte.map { |b| b.to_s(16) }.join
      raw = (buffer[0].ord << 8 | buffer[1].ord) & 0xFFFC
      value = raw / 65536.0
      @humidity = -6.0 + (125.0 * value) # See page 15 of the datasheet
    end

    def delay(ms=100)
      sleep 0.001*ms
    end
  end
end
