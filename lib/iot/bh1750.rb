require 'bus'
require_relative 'digital_receptor'

module IoT
  # BH1750 - ambient light sensor
  class BH1750 < IoT::DigitalReceptor
    DEVICE     = 0x23 # I2C sensor address
    POWER_DOWN = 0x00 # off state
    POWER_ON   = 0x01 # on state
    RESET      = 0x07 # reset state: POWER_DOWN = 0x00

    CONTINUOUS_LOW_RES_MODE = 0x13    # Measure with resolution 4.0 lx and timing ~16 ms
    CONTINUOUS_HIGH_RES_MODE_1 = 0x10 # Measure with resolution 1.0 lx and timing ~120 ms
    CONTINUOUS_HIGH_RES_MODE_2 = 0x11 # Measure with resolution 0.5 lx and timing ~120 ms
    ONE_TIME_LOW_RES_MODE = 0x23      # Measure with resolution 4.0 lx, POWER DOWN after measuring
    ONE_TIME_HIGH_RES_MODE_1 = 0x20   # Measure with resolution 1.0 lx, POWER DOWN after measuring
    ONE_TIME_HIGH_RES_MODE_2 = 0x21   # Measure with resolution 0.5 lx, POWER DOWN after measuring

    def initialize(device_address=DEVICE, bus_number=1)
      @sensor_name = 'BH1750'
      Bus::I2C.bus_number = bus_number
      @device_address = device_address

      @i2c_bus = Bus::I2C.bus
      @device = I2CDevice.new(address: DEVICE, driver: I2CDevice::Driver::I2CDev.new(@i2c_bus))
      @resolution = ONE_TIME_HIGH_RES_MODE_1
      @length = 2
      @value = read
    end

    # Read raw data from sensor and convert it to numeric
    def read
      data = @device.i2cget(@resolution, @length)
      @value = to_f(data)
    end

    # Return value in Lux
    def lux
      read
      @value
    end


    def name
      @sensor_name
    end

private
    # Convert 2 bytes of sensor data to a float number
    def to_f(data)
      return ((data[1].ord + (256 * data[0].ord)) / 1.2) 
    end
  end
end
