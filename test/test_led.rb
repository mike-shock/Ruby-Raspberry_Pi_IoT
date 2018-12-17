#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'led'

class RaspberryPiIoTLedTest < Minitest::Test
  def setup
    @pin = 1
    @color = :red
    @led = LED.new(18)
    @led.off
  end

  def test_on
    @led.on
    assert @led.on?
#    assert !@led.off?
    sleep 0.5
    @led.off
  end

  def test_on
    @led.off
#    assert @led.off?
    assert !@led.on?
    sleep 0.5
  end

  def test_blink
    @led.blink(3)
    @led.off
    sleep 0.5
  end

  def test_sos
    3.times { @led.on_for(0.5); @led.off_for(0.25) }
    sleep 0.5
    3.times { @led.on_for(0.15); @led.off_for(0.25) }
    sleep 0.5
    3.times { @led.on_for(0.5); @led.off_for(0.25) }
    sleep 1.5
    @led.off
  end
end