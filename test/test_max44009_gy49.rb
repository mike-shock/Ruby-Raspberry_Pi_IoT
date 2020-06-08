#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/max44009'

class RaspberryPiIoT_MAX44009Test < MiniTest::Test

  def setup
    @bus = 1
    @address = 0x4a
    @addr_s  = sprintf("%02x", @address)
    @sensor = IoT::MAX44009.new
  end

  def test_i2c_bus
    assert File.exist?(Bus::I2C.bus)
  end

  def test_device_address
    i2cd = `i2cdetect -y #{@bus}`
    hex = i2cd.scan(/ (#{@addr_s})/).flatten
    assert hex.size == 1 && hex[0] == @addr_s
  end

  def test_sensor_value
    value = @sensor.lux
    assert value > 0.0
  end
end
