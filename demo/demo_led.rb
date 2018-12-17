#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "led"

led = LED.new(18)

printf "=== %s DEMO ===\n", led.name

5.times do |n|
  print ' ', n, ' '
  led.on
  print (led.on? ? 'X':'o')
  sleep 1
  led.off
  sleep 1
  print (led.on? ? 'X':'o')
end

print "\n Blinking x 3...\n"
led.blink(3)
led.off

print "Signalling SOS x 3... \n"
2.times do
  3.times { led.on_for(0.5); led.off_for(0.25) }
  sleep 0.5
  3.times { led.on_for(0.15); led.off_for(0.25) }
  sleep 0.5
  3.times { led.on_for(0.5); led.off_for(0.25) }
  sleep 1.5
end
led.off
