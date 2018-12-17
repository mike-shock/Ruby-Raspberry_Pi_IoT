#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require 'bh1750'

  light_sensor = BH1750.new

  128.times do |n|
    printf "%02d Luminosity Level: %f lx\n", n, light_sensor.lux
    sleep(0.5)
  end

