#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/hcsr501"

sensor = IoT::HCSR501.new(17)
printf "=== %s DEMO ===\n", sensor.name

t = 6
printf "Testing %d times...\n", t

t.times do |n|
  value = sensor.high?
  printf "%02d ", n
  if value
    printf "%d HIGH!!!\n", n
  else
    printf "%d LOW!\n", n
  end
  sleep 1
end
