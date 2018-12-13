#!/usr/bin/ruby

require "thermal_sensor"

sensor1 = RaspberryPi::ThermalSensor.new

12.times do
  sensor1.read_data
  print "Temperature: "
  printf "%7.4f°C ",  sensor1.celsius
  printf "%7.4f°Ré ", sensor1.reaumur
  printf "%7.4f°F ",  sensor1.fahrenheit
  printf "%7.4f K ",  sensor1.kelvin
  print "\n"
  sleep 1
end

sensor2 = ThermalSensor.new
print "\n"
printf "%7.4f°C ",  sensor2.celsius
