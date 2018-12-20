require 'binary_effector'

# LED - Light Emitting Diode
class LED < BinaryEffector
  def initialize(pin)
    super(pin)
    self.name = 'LED'
  end

  # Turn on the LED.
  def on(pin=@pin)
    super(pin)
  end

  # Turn off the LED.
  def off(pin=@pin)
    super(pin)
  end

  # Repeat 'repeat' times: light the LED for 'switched_on' secs, then pause for 'switched_off' secs
  def blink(repeat=3, switched_on=0.25, switched_off=0.5)
    repeat.times do |n|
      on
      sleep switched_on
      off
      sleep switched_off
    end
  end

  # Turn the LED on for N seconds.
  def on_for(seconds=1)
    on
    sleep seconds
    off
  end

  # Turn the LED off for N seconds.
  def off_for(seconds=1)
    off
    sleep seconds
    on
  end
end

# Experimental methods with names in Russian
class LED
  def LED.создать(pin = 25)
    LED.new(pin)
  end

  def включить
    on
  end

  def выключить
    off
  end

  def мигать(repeat=3, switched_on=0.25, switched_off=0.5)
    blink(repeat, switched_on, switched_off)
  end
end
