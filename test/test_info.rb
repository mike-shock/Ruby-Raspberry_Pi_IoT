#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'iot'
require 'raspberry_pi'

class RaspberryPiIoTInfoTest < Minitest::Test

  def test_model_name
    assert_equal RaspberryPi.model_name()[0..11], "Raspberry Pi"
  end

  def test_info
    assert_equal RaspberryPi.hardware_info['SoC'][0..2], "BCM"
  end

#IoT::Log.new.message "I", "Test logging."
end


