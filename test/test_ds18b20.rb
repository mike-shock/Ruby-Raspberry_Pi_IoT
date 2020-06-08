#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot"
require "iot/ds18b20"

class RaspberryPiIoT_DS18B20Test < MiniTest::Test

  def setup
    @sensor = IoT::DS18B20.new
  end

  def test_sensor_value
    c = @sensor.celsius
    assert c > 15.0

    r = @sensor.reaumur
    assert r < c

    f = @sensor.fahrenheit
    assert f > c

    k = @sensor.kelvin
    assert k > f
  end
end

