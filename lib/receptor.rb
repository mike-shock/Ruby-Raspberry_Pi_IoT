require 'rpi_gpio'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

# Receptor - physical device that can provide info about real world
class Receptor
  @model = 'N/A'
  @name = 'N/A'
  @value = nil

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

# Sensor - a synonym for Receptor
class Sensor < Receptor

end
