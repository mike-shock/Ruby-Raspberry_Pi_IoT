#!/usr/bin/ruby

require 'minitest/autorun'

$LOAD_PATH << "../lib"
require 'iot'
require 'raspberry_pi'

class RaspberryPiIoT_InfoTest < Minitest::Test

  def test_model_name
    assert_equal RaspberryPi.model_name()[0..11], "Raspberry Pi"
  end

  def test_info
    assert_equal RaspberryPi.hardware_info['SoC'][0..2], "BCM"
  end

  def test_hostname
    assert RaspberryPi.host_name().size > 0
  end

  def test_ip
    assert RaspberryPi.host_ip().class.to_s == 'Array'
  end

  def test_space
    a = RaspberryPi.disk_space('*')
    assert a.flatten.size > a.size
    h = RaspberryPi.disk_space('*', true)
    assert h.class.to_s == 'Hash'
    assert h['/'].size == 6
    assert h['/'][:mounted] == '/'

    assert RaspberryPi.disk_space().class.to_s == 'Array'
    assert RaspberryPi.disk_space() == RaspberryPi.disk_space('/', false)
    assert RaspberryPi.disk_space('/')[-1] == '/'
    assert RaspberryPi.disk_space('/', true).class.to_s == 'Hash'
  end
end

#IoT::Log.new.message "I", "Test logging."


