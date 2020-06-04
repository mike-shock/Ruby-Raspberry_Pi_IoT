#!/usr/bin/ruby

require 'minitest/autorun'

#$LOAD_PATH << "../lib"
require "dht_sensor"

class RaspberryPiIoT_DHT11Test < MiniTest::Test

  def setup
    @pin = 23
    @sensor = DHT11.new(@pin)
  end

  def test_temperature
    c = @sensor.celsius
    assert c > 15.0

    r = @sensor.reaumur
    assert r < c

    f = @sensor.fahrenheit
    assert f > c

    k = @sensor.temperature(:kelvin)
    assert k > f
  end

  def test_humidity
    h = @sensor.humidity
    assert h > 10.0
  end
end


