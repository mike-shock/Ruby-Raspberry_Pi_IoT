#!/usr/bin/env ruby

$LOAD_PATH << "../lib"
require 'i2c'
require "bmx_sensor"

sensor = BMP280.new
printf "%s\n", sensor.to_s

while true do
  sensor.read_data
  printf "T: %7.4f°C ", sensor.celsius
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

