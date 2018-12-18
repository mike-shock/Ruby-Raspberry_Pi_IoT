require 'receptor'

# BinaryReceptor - receptor/actuator with binary logic
class BinaryReceptor < Receptor
  @pin = nil # pin

  def initialize(pin=21, pull=:up)
    @pin = pin
    RPi::GPIO.setup pin, :as => :input, :pull => pull
  end

  def high?
    RPi::GPIO.high? @pin
  end

  def low?
    RPi::GPIO.low? @pin
  end
end
