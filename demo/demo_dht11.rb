#!/usr/bin/env ruby

$LOAD_PATH << "../lib"
require "dht_sensor"

sensor = DHT11.new(23)

while true do
  sensor.read_data
  print "Temperature: "
  printf "%7.4f°C ",  sensor.celsius
  printf "%7.4f°Ré ", sensor.reaumur
  printf "%7.4f°F ",  sensor.fahrenheit
  printf "%7.4f K ",  sensor.temperature(:kelvin)
  printf "Humidity: %f %%\n", sensor.humidity
  sleep 1
end
