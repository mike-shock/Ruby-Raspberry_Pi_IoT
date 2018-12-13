#!/usr/bin/ruby

require "raspberry_pi"

printf "Model: %s\n", RaspberryPi.pi_model()

RaspberryPi.hardware_info().each do |k, v|
  printf "%s: %s\n", k, v
end

