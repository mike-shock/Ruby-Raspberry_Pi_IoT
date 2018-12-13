#!/usr/bin/ruby
require 'max44009'

sensor = MAX44009.new

32.times do |n|
  printf "%02d Ambient light level: %f lx \n", n, sensor.lux
  sleep 0.5
end
