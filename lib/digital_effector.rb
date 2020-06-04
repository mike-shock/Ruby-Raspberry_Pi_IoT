require 'effector'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

# DigitalEffector - effector/actuator with digitized control
class DigitalEffector < Effector
  def initialize(pins={}, state=:low)
    @pin = nil
    @states = {} # ON / Off states for pin numbers
    @pins = pins # DigitalEffector.new {red: 17, green: 28, blue: 22}
    @pins.each_value do |pin|
      RPi::GPIO.setup pin, :as => :output, :initialize => state
      @states[pin] = (state == :high)
    end
    @pin = pins.values[0] # default pin
  end

  def self.on(pin=@pin)
    RPi::GPIO.set_high pin
  end

  def self.off(pin=@pin)
    RPi::GPIO.set_low pin
  end

  def on(pin=@pin)
    DigitalEffector.on pin
    @states[pin_number(pin)] = true
  end

  def off(pin=@pin)
    DigitalEffector.off pin
    @states[pin_number(pin)] = false
  end

  def on?(pin=@pin)
    @states[pin_number(pin)]
  end

  def off?(pin=@pin)
    !on?(pin)
  end

private
  def pin_number(pin)
    if (pin.class.name == 'Integer') || (pin.class.name == 'Fixnum') # by number
      pin
    elsif @pins[pin]              # by name as Symbol
      @pins[pin]
    end
  end

  def high?(pin=@pin)
    RPi::GPIO.high? pin
  end

  def low?(pin=@pin)
    RPi::GPIO.low? pin
  end

  def state
   [@pins, @states]
  end
end
