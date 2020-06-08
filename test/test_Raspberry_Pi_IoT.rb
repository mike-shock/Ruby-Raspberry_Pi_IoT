#!/usr/bin/ruby

require_relative "test_helper"

class RaspberryPiIoTTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RaspberryPiIoT::VERSION
  end

end
