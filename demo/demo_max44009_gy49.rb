#!/usr/bin/ruby
$LOAD_PATH << "../lib"
require 'max44009'

sensor = MAX44009.new
printf "=== %s DEMO ===\n", sensor.name

12.times do |n|
  printf "%02d Ambient light level: %f lx \n", n, sensor.lux
  sleep 0.5
end
