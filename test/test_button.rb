#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require "button"

class RaspberryPiIoT_ButtonTest < MiniTest::Test

  def setup
    @pin = 21
    @button = Button.new(@pin)
  end

  def test_wait_for_press
    printf "Waiting for press...\n"
    @button.wait_for_press
    assert @button.not_pressed?
  end


  def test_wait_for_short_press
    printf "Waiting for 1 short press...\n"
    @button.wait_for_press
    assert @button.single_press?
    assert !@button.long_press?
  end

  def test_wait_for_long_press
    printf "Waiting for 1 long press...\n"
    @button.wait_for_press
    assert !@button.single_press?
    assert @button.long_press?
  end

  def test_wait_for_double_press
    printf "Waiting for double press...\n", p
    @button.wait_for_presses 2
    assert @button.double_press?
  end
end
