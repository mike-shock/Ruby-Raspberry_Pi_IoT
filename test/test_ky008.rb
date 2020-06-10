#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
  require 'iot/binary_effector'

  laser = IoT::BinaryEffector.new(4)

class RaspberryPiIoT_LedTest < Minitest::Test
  def setup
    @pin = 26
    @laser = IoT::BinaryEffector.new(@pin)
    @laser.off
  end

  def test_on_off
    @laser.on
    assert @laser.on?
    assert !@laser.off?
    sleep 3
    @laser.off
  end

  def test_off_on
    @laser.off
    assert @laser.off?
    assert !@laser.on?
    sleep 1
  end

  def test_sos
    3.times { @laser.on; sleep(0.25); @laser.off; sleep(0.25) }
    sleep 1
    3.times { @laser.on; sleep(0.5); @laser.off; sleep(0.25) }
    sleep 1
    3.times { @laser.on; sleep(0.25); @laser.off; sleep(0.25) }
    sleep 1.5
    @laser.off
  end
end
