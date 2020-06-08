#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/bh1750'

sensor = IoT::BH1750.new
printf "=== %s DEMO ===\n", sensor.name

t = 6
t.times do |n|
  printf "%02d Luminosity Level: %f lx\n", n, sensor.lux
  sleep(0.5)
end

