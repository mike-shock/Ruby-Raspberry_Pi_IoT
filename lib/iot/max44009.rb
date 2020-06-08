require 'bus'

module IoT
  # MAX44009 - low-power ambient Light Sensor
  # Output: digital, Bus: I²C, Range: 0.045..188,000 Lux, VCC: 1.7..3.6V, Operating Current: 0.65µA
  # https://datasheets.maximintegrated.com/en/ds/MAX44009.pdf
  class MAX44009
    MAX44009_DEFAULT_ADDRESS = 0x4A
    # MAX44009 Register Map
    MAX44009_REG_INTR_STATUS = 0x00 # Interrupt Status Register
    MAX44009_REG_INTR_ENABLE = 0x01 # Interrupt Enable Register
    MAX44009_REG_CONFIG = 0x02 # Configuration Register
    MAX44009_REG_LUX_HIGH = 0x03 # Lux High Byte
    MAX44009_REG_LUX_LOW = 0x04 # Lux Low Byte
    MAX44009_REG_THRES_UP_HI = 0x05 # Upper Threshold High Byte
    MAX44009_REG_THRES_LO_HI = 0x06 # Upper Threshold Low Byte
    MAX44009_REG_THRES_TIMER = 0x07 # Threshold Timer
    # MAX44009 INTERRUPT ENABLE REGISTER
    MAX44009_REG_INTR_ENABLE_NO_ASSRT = 0x00 # The INT pin and the INTS bit are not asserted even if an interrupt event has occurred
    MAX44009_REG_INTR_ENABLE_TRIGGER = 0x01 # Detection of an interrupt event triggers a hardware interrupt
    # MAX44009 CONFIGURATION REGISTER
    MAX44009_REG_CONFIG_CONTMODE_DEFAULT = 0x00 # Default mode
    MAX44009_REG_CONFIG_CONTMODE_CONTIN = 0x80 # Continuous mode
    MAX44009_REG_CONFIG_MANUAL_DEFAULT = 0x00 # Default mode of configuration is used for the IC
    MAX44009_REG_CONFIG_MANUAL_MODEON = 0x40 # Manual mode of configuration is used for the IC
    MAX44009_REG_CONFIG_CDR_NODIVIDED = 0x00 # Current not divided. All of the photodiode current goes to the ADC
    MAX44009_REG_CONFIG_CDR_DIVIDED = 0x08 # Current divided by 8
    MAX44009_REG_CONFIG_INTRTIMER_800 = 0x00 # Integration Time = 800ms, This is a preferred mode for boosting low-light sensitivity
    MAX44009_REG_CONFIG_INTRTIMER_400 = 0x01 # Integration Time = 400ms
    MAX44009_REG_CONFIG_INTRTIMER_200 = 0x02 # Integration Time = 200ms
    MAX44009_REG_CONFIG_INTRTIMER_100 = 0x03 # Integration Time = 100ms, This is a preferred mode for high-brightness applications
    MAX44009_REG_CONFIG_INTRTIMER_50 = 0x04 # Integration Time = 50ms, Manual Mode only
    MAX44009_REG_CONFIG_INTRTIMER_25 = 0x05 # Integration Time = 25ms, Manual Mode only
    MAX44009_REG_CONFIG_INTRTIMER_12_5 = 0x06 # Integration Time = 12.5ms, Manual Mode only
    MAX44009_REG_CONFIG_INTRTIMER_6_25 = 0x07 # Integration Time = 6.25ms, Manual Mode only
 
    DEVICE = MAX44009_DEFAULT_ADDRESS # I2C sensor address

    def initialize(i2c_bus='/dev/i2c-1')
      @sensor_name = 'MAX44009'
      @i2c_bus = i2c_bus
      @device = I2CDevice.new(address: DEVICE, driver: I2CDevice::Driver::I2CDev.new(@i2c_bus))
      write_config()
      @length = 2
      @value = read_sensor
    end

    def name
      @sensor_name
    end

    def write_config()
      # Select the configuration register data from the given provided values
      config = (MAX44009_REG_CONFIG_CONTMODE_CONTIN | MAX44009_REG_CONFIG_MANUAL_MODEON | MAX44009_REG_CONFIG_CDR_NODIVIDED | MAX44009_REG_CONFIG_INTRTIMER_800)
      @device.i2cset(MAX44009_REG_CONFIG, config)
    end

    def read_sensor
      # Read data back from MAX44009_REG_LUX_HIGH(0x03), 2 bytes, luminance MSB, luminance LSB
      data = @device.i2cget(MAX44009_REG_LUX_HIGH, 2)
      @value = data_to_lux(data)
    end

    def lux
    # Return value in LX
      read_sensor
      @value
    end

private
    # Convert the data to lux
    def data_to_lux(data)
      exponent = (data[0].ord & 0xF0) >> 4
      mantissa = ((data[0].ord & 0x0F) << 4) | (data[1].ord & 0x0F)
      luminance = ((2 ** exponent) * mantissa) * 0.045
      luminance
    end

    # convert sensor data to a float number
    def to_f(data)
      return ((data[1].ord + (256 * data[0].ord)) / 1.2)
    end
  end
end
