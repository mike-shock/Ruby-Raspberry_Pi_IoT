#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/bmx_sensor"

class RaspberryPiIoT_BMP280Test < MiniTest::Test

  def setup
    @sensor = IoT::BMP280.new
  end

  def test_temperature_value
    @sensor.read_data
    c = @sensor.celsius
    assert c > 15.0

    r = @sensor.reaumur
    assert r < c

    f = @sensor.fahrenheit
    assert f > c

    k = @sensor.kelvin
    assert k > f
  end

  def test_pressure_value
    @sensor.read_data
    m = @sensor.pressure(:mmHg)
    assert m > 750.0

    h = @sensor.pressure(:hPa)
    assert h > m

    k = @sensor.pressure(:kPa)
    assert k == h / 10.0

    p = @sensor.pressure(:Pa)
    assert p > k

    a = @sensor.pressure(:atm)
    assert a < m

    b = @sensor.pressure(:bar)
    assert b > a

    t = @sensor.pressure(:Torr)
    assert t < b
  end
end
