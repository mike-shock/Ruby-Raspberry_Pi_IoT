require 'rpi_gpio'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

module IoT
  # Receptor - physical device that can provide info about real world
  class Receptor
    def initialize
      @model = 'N/A'
      @name = 'N/A'
      @value = nil
    end

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
end
