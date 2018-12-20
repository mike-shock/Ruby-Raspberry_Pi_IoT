#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'led_rgb'

class RaspberryPiIoT_LedRgbTest < Minitest::Test
  def setup
    @red = 17
    @green = 27
    @blue = 22
    @rgb = LED::RGB.new(@red, @green, @blue)
    @time_on = 0.25
    @time_off = 0.25
  end

  def test_red
    @rgb.on :red
    assert @rgb.on? :red
    sleep @time_on
    @rgb.off
    assert @rgb.off? :red
  end

  def test_green
    @rgb.on :green
    assert @rgb.on? :green
    sleep @time_on
    @rgb.off
    assert @rgb.off? :green
  end

  def test_blue
    @rgb.on :blue
    assert @rgb.on? :blue
    sleep @time_on
    @rgb.off
    assert @rgb.off? :blue
  end

  def test_all_on
    @rgb.on :all
    assert @rgb.on? :red
    assert @rgb.on? :green
    assert @rgb.on? :blue
    sleep @time_on
  end

  def test_all_off
    @rgb.off :all
    assert @rgb.off? :red
    assert @rgb.off? :green
    assert @rgb.off? :blue
  end

  def test_colors
    1.times do |n|
      [:red, :green, :blue, :yellow, :aqua].each do |color|
        @rgb.on color
        sleep @time_on
        @rgb.off
        sleep @time_off
      end
    end
  end

  def test_blink_one
    @rgb.blink :green, 4
  end

  def test_blink_two
    @rgb.blink [:red, :blue], 2
  end

  def test_sos
    @rgb.blink :red, 3, 0.25, 0.25
    sleep 1
    @rgb.blink :red, 3, 0.5, 0.5
    sleep 1
    @rgb.blink :red, 3, 0.25, 0.25
    assert @rgb.off?
    sleep 1
  end
end
