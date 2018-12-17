#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "iot"
require "raspberry_pi"

printf "Model: %s\n", RaspberryPi.model_name()

RaspberryPi.hardware_info().each do |k, v|
  printf "%s: %s\n", k, v
end

#IoT::Log.new.message "I", "Test logging."

