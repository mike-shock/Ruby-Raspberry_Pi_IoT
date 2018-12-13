
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
    @@i2c_bus = '/dev/i2c-1'
    def self.set_bus(bus=1)
      @@i2c_bus = "/dev/i2c-#{bus}"
    end
  end

  # SPI interface to devices
  class SPI
  end
end
