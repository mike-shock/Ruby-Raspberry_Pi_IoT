#!/usr/bin/ruby
require 'max44009'

$LOAD_PATH << "../lib"
sensor = MAX44009.new

12.times do |n|
  printf "%02d Ambient light level: %f lx \n", n, sensor.lux
  sleep 0.5
end
