#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'bmx_sensor'

class RaspberryPiIoT_BMP280Test < MiniTest::Test

  def setup
    @bus = 1
    @address = 0x76
    @addr_s  = sprintf("%02x", @address)
    @sensor = BMP280.new
  end

  def test_device_address
    i2cd = `i2cdetect -y #{@bus}`
    hex = i2cd.scan(/ (#{@addr_s})/).flatten
    assert hex.size == 1 && hex[0] == @addr_s
  end

  def test_temperature
    c = @sensor.celsius
    assert c > 15.0

    r = @sensor.reaumur
    assert r < c

    f = @sensor.fahrenheit
    assert f > c

    k = @sensor.kelvin
    assert k > f
  end

  def test_pressure
    m = @sensor.pressure(:mmHg)
    assert m > 650.0

    p = @sensor.pressure(:Pa)
    assert p > m

    a = @sensor.pressure(:atm)
    assert a == p / 101325.0

    b = @sensor.pressure(:bar)
    assert b == p / 100000.0

    t = @sensor.pressure(:Torr)
    assert t == a / 760.0
  end
end
