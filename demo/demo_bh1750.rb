#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require 'bh1750'

  sensor = BH1750.new
  printf "=== %s DEMO ===\n", sensor.name

  12.times do |n|
    printf "%02d Luminosity Level: %f lx\n", n, sensor.lux
    sleep(0.5)
  end

