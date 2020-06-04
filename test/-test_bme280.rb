#!/usr/bin/ruby

require 'minitest/autorun'

#$LOAD_PATH << "../lib"
require "bmx_sensor"

class RaspberryPiIoT_BMP280Test < MiniTest::Test

  def setup
    @sensor = BME280.new
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
    # T: 27.2782°C P: 757.3502 mmHg 1009.7172 hPa 100971.7158 Pa 0.99651 atm 1.00972 bar 0.00131 Torr 
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

  def test_humidity_value
    h = @sensor.humidity
    assert h > 0.0
  end
end

