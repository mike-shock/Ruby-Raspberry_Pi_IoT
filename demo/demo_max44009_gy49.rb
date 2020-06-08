#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/max44009'

sensor = IoT::MAX44009.new
printf "=== %s DEMO ===\n", sensor.name

t = 6
t.times do |n|
  printf "%02d Ambient light level: %f lx \n", n, sensor.lux
  sleep 0.5
end
