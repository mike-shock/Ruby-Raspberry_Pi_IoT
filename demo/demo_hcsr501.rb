#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "hcsr501"

pir = HCSR501.new(17)

t = 100
printf "Testing %d times...\n", t

t.times do |n|
  value = pir.high?
  if value
    printf "%d HIGH!!!\n", n
  else
    printf "%d LOW!\n", n
  end
  sleep 1
end

