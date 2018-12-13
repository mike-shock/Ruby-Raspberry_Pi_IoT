# https://github.com/ClockVapor/rpi_gpio
require 'rpi_gpio'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

# Effector - a controlled physical device that performs some (useful) action
class Effector
  @model = 'N/A'
  @name = 'N/A'

  def name
    @name
  end

  def model_name
    @model
  end

protected
  def name=(name)
    @name = name
  end

  def model_name=(name)
    @model_name = name
  end
end

# Actuator - a synonym for Effector
class Actuator < Effector
end
