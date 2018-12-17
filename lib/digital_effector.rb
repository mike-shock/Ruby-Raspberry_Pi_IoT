require 'effector'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

# DigitalEffector - effector/actuator with digitized control
class DigitalEffector < Effector
  @pin = nil
  @pins = {} # GPIO pins

  def initialize(pins, state=:low)
    @states = {}
    @pins = pins
    @pins.each_value do |pin|
      RPi::GPIO.setup pin, :as => :output, :initialize => state
      @states[pin] = (state == :high)
    end
    @pin = pins.values[0]
  end

  def self.on(pin=@pin)
    RPi::GPIO.set_high pin
  end

  def self.off(pin=@pin)
    RPi::GPIO.set_low pin
  end

  def on(pin=@pin)
    BinaryEffector.on @pin
    @states[pin] = true
  end

  def off(pin=@pin)
    BinaryEffector.off @pin
    @states[pin] = false
  end

  def on?(pin=@pin)
    state = nil
    if pin.class.name == 'Fixnum' # by number
      state = @states[pin]
    elsif @pins[pin]              # by name
      state = @states[@pins[pin]]
    end
    state
  end

  def off?(pin=@pin)
    !on(pin)
  end
end
