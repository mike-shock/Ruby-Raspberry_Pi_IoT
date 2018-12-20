#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'led'

class RaspberryPiIoT_LedTest < Minitest::Test
  def setup
    @pin = 18
    @color = :red
    @led = LED.new(@pin)
    @led.off
  end

  def test_on
    @led.on
    assert @led.on?
    assert !@led.off?
    sleep 0.5
    @led.off
  end

  def test_on
    @led.off
    assert @led.off?
    assert !@led.on?
    sleep 0.5
  end

  def test_blink
    @led.blink(3)
    @led.off
    sleep 0.5
  end

  def test_sos
    3.times { @led.on_for(0.25); @led.off_for(0.25) }
    sleep 1
    3.times { @led.on_for(0.5); @led.off_for(0.25) }
    sleep 1
    3.times { @led.on_for(0.25); @led.off_for(0.25) }
    sleep 1.5
    @led.off
  end
end
