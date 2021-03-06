#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/bh1750'

class RaspberryPiIoT_BH1750Test < MiniTest::Test

  def setup
    @bus = 1
    @address = 0x23
    @addr_s  = sprintf("%02x", @address)
    @sensor = IoT::BH1750.new(@address, @bus)
  end

  def test_i2c_bus
    assert File.exist?(Bus::I2C.bus)
  end

  def test_device_address
    i2cd = `i2cdetect -y #{@bus}`
    hex = i2cd.scan(/ (#{@addr_s})/).flatten
    assert hex.size == 1 && hex[0] == @addr_s
  end

  def test_reading_sensor
    value = @sensor.read
    assert value > 0.0
  end

  def test_sensor_value
    value = @sensor.lux
    assert value > 0.0
  end
end
