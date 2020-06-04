#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "ds18b20"

sensor = DS18B20.new
printf "=== %s DEMO ===\n", sensor.name

10.times do
  sensor.read_data
  print "Temperature: "
  printf "%7.4f°C ",  sensor.celsius
  printf "%7.4f°Ré ", sensor.reaumur
  printf "%7.4f°F ",  sensor.fahrenheit
  printf "%7.4f K ",  sensor.kelvin
  print "\n"
  sleep 1
end
