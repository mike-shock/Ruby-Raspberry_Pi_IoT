#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require "thermal_sensor"

class RaspberryPiIoT_ThermalSensorTest < MiniTest::Test

  def setup
    @sensor = RaspberryPi::ThermalSensor.new
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
