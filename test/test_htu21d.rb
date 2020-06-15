#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/htu21d"

class RaspberryPiIoT_HTU21DTest < MiniTest::Test

  def setup
    @sensor = IoT::HTU21D.new
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


