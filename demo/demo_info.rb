#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'raspberry_pi'

printf "=== %s DEMO ===\n", 'Info'
printf "Model: %s\n", RaspberryPi.model_name()

RaspberryPi.hardware_info().each do |k, v|
  printf "%s: %s\n", k, v
end

#IoT::Log.new.message "I", "Test logging."

