#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require 'iot/led'

led = IoT::LED.new(18)
printf "=== %s DEMO ===\n", led.name

  led.on
  is_on  = led.on?
  is_off = led.off?
  printf "ON: on?=%s, off?=%s\n", is_on, is_off
  led.off
  is_on  = led.on?
  is_off = led.off?
  printf "OFF: on?=%s, off?=%s\n", is_on, is_off

5.times do |n|
  print ' ', n, ' '
  led.on
  sleep 1
  led.off
  sleep 1
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
