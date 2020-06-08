#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/led'

class RaspberryPiIoT_LedTest < Minitest::Test
  def setup
    @pin = 18
    @color = :red
    @led = IoT::LED.new(@pin)
    @led.off
  end

  def test_on_off
    @led.on
    assert @led.on?
    assert !@led.off?
    sleep 0.5
    @led.off
  end

  def test_off_on
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
