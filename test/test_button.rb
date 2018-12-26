#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require "button"

class RaspberryPiIoT_ButtonTest < MiniTest::Test

  def setup
    @pin = 21
    @button = Button.new(@pin)
    @button.set_timeout 10
  end

  def test_wait_for_press
    assert @button.not_pressed?
    assert @button.was_not_pressed?
    printf "Waiting for press...\n"
    @button.wait_for_press
    assert @button.was_pressed? unless @button.timeout?

  end


  def test_wait_for_short_press
    printf "Waiting for 1 short press...\n"
    @button.wait_for_press
    unless @button.timeout?
      assert @button.single_press?
      assert !@button.long_press?
    end
  end

  def test_wait_for_long_press
    printf "Waiting for 1 long press (> 1 second)...\n"
    @button.wait_for_press
    unless !@button.timeout?
      assert @button.single_press?
      assert !@button.double_press?
      assert @button.long_press?
    end
  end

  def test_wait_for_double_press
    printf "Waiting for double press...\n", p
    @button.wait_for_presses 2
    unless @button.timeout?
      assert @button.double_press?
      assert !@button.single_press?
    end
  end
end
