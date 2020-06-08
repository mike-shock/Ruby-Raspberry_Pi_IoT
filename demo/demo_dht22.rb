#!/usr/bin/env ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/dht_sensor"

sensor = IoT::DHT22.new(23)
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
  printf "Humidity: %f %%\n", sensor.humidity
  sleep 1
end
