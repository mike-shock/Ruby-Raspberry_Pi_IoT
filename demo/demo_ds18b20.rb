#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
#require 'raspberry_pi_iot'
require "iot/ds18b20"

sensor = IoT::DS18B20.new
printf "=== %s DEMO ===\n", sensor.name

t = 6
t.times do |n|
  sensor.read_data
  printf "%02d ", n
  print "Temperature: "
  printf "%7.4f°C ",  sensor.celsius
  printf "%7.4f°Ré ", sensor.reaumur
  printf "%7.4f°F ",  sensor.fahrenheit
  printf "%7.4f K ",  sensor.kelvin
  print "\n"
  sleep 1
end
