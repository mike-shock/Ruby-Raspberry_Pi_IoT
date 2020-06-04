#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "thermal_sensor"

sensor = RaspberryPi::ThermalSensor.new
printf "=== %s DEMO ===\n", sensor.name

12.times do |n|
  sensor.read_data
  printf "%02d Temperature: ", n
  printf "%7.4f°C ", sensor.celsius
  printf "%7.4f°Ré ", sensor.reaumur
  printf "%7.4f°F ",  sensor.fahrenheit
  printf "%7.4f°K \n",  sensor.kelvin
  sleep 1
end
