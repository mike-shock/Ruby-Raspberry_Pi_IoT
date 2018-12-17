#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'bh1750'

class RaspberryPiIoTBH1750Test < MiniTest::Test

  def setup
    @bus = 1
    @address = 0x23
    @addr_s  = sprintf("%02x", @address)
  end

  def test_i2c_bus
    assert File.exists?(Bus::I2C.bus)
  end

  def test_device_address
    i2cd = `i2cdetect -y #{@bus}`
    hex = i2cd.scan(/ (#{@addr_s})/).flatten
    assert hex.size == 1 && hex[0] == @addr_s
  end

  def test_sensor_value
    sensor = BH1750.new(@address, @bus)
    value = sensor.lux
    assert value > 0.0
  end
end