#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/bh1750'

sensor = IoT::BH1750.new(0x23, 1)
printf "=== %s DEMO ===\n", sensor.name

t = 6
t.times do |n|
  printf "%02d Luminosity Level: %f lx (%f)\n", n, sensor.read, sensor.lux
  sleep(0.5)
end

