#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/button"

class RaspberryPiIoT_ButtonTest < MiniTest::Test

  def setup
    @pin = 21
    @button = IoT::Button.new(@pin)
    @button.set_timeout 12
  end

  def test_wait_for_press
    assert @button.not_pressed?
    assert @button.was_not_pressed?
    printf "Waiting for a press...\n"
    @button.wait_for_press
    assert @button.was_pressed? unless @button.timeout?

  end

  def test_wait_for_short_press
    printf "Waiting for 1 short press (< 1 second)...\n"
    @button.wait_for_press
    unless @button.timeout?
      assert @button.single_press?
      assert !@button.long_press?
    end
  end

  def test_wait_for_long_press
    printf "Waiting for 1 long press (> 1 second)...\n"
    @button.wait_for_press
    unless @button.timeout?
      assert !@button.double_press?
      assert @button.single_press?
      assert @button.long_press?
    end
  end

  def test_wait_for_double_press
    printf "Waiting for double press (2 sequential short presses)...\n"
    @button.wait_for_presses 2
    unless @button.timeout?
      assert @button.double_press?
      assert !@button.single_press?
    end
  end
end
