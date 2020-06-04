#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "hcsr501"

sensor = HCSR501.new(17)
printf "=== %s DEMO ===\n", sensor.name

t = 5
printf "Testing %d times...\n", t

t.times do |n|
  value = sensor.high?
  if value
    printf "%d HIGH!!!\n", n
  else
    printf "%d LOW!\n", n
  end
  sleep 1
end

