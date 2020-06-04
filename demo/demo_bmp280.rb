#!/usr/bin/env ruby

$LOAD_PATH << "../lib"
require 'bmx_sensor'

sensor = BMP280.new
printf "=== %s DEMO ===\n", sensor.name
printf "%s\n", sensor.to_s

12.times do |n|
  sensor.read_data
  printf "%02d T: %7.4f°C ", n, sensor.celsius
  printf "P: %7.4f mmHg ", sensor.pressure(:mmHg)
  printf "%7.4f hPa ",  sensor.pressure(:hPa)
#  printf "%7.4f kPa ",  sensor.pressure(:kPa)
  printf "%7.4f Pa ",   sensor.pressure(:Pa)
  printf "%7.5f atm ",  sensor.pressure(:atm)
  printf "%7.5f bar ",  sensor.pressure(:bar)
  printf "%7.5f Torr ", sensor.pressure(:Torr)
  printf "\n"
  sleep 1
end

