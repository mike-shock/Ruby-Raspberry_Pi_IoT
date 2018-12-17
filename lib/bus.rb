
#$LOAD_PATH << '~/lib/ruby-i2c-devices/lib'
gem 'i2c-devices'
require 'i2c'
require 'i2c/driver/i2c-dev'

# Bus - interfaces for physical devices
module Bus
  # 1-wire interface to devices
  class OneWire
    @@one_wire_bus = '/sys/bus/w1/devices'
    @sensor_file = nil
  end

  # I2C interface to devices
  class I2C
    @@bus_number = 1
    @@i2c_bus = '/dev/i2c-1'
    @device_address = 0x00

    # Define the I2C bus number: 0 | 1 (default)
    def self.bus_number=(bus=1)
      @@bus_number = bus
      @@i2c_bus = "/dev/i2c-#{bus}"
    end

    def self.bus_number
      @@bus_number
    end

    # Return the I2C bus file
    def self.bus
      @@i2c_bus
    end

    # Define the device address
    def device_address=(address)
      @device_address = address
    end

    # Return the device address
    def device_address
      @device_address
    end
  end

  # SPI interface to devices
  class SPI
  end
end
