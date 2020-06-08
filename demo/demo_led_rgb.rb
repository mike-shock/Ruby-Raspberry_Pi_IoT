#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/led_rgb"

rgb = IoT::LED::RGB.new(17, 27, 22)
printf "=== %s DEMO ===\n", rgb.name

rgb.on :red
sleep 0.25
rgb.on :green
sleep 0.25
rgb.on :blue
sleep 0.25
sleep 2
rgb.off :all
sleep 0.5

1.times do |n|
  [:red, :green, :blue, :yellow, :aqua].each do |color|
    print color.to_s, ' '
    rgb.on color
    sleep 1
    rgb.off # color
    sleep 1
  end
  print "\n"
end

print "Blinking 3 x RGB...\n"
rgb.blink
sleep 0.5

print "Blinking 2 x red & blue...\n"
rgb.blink [:red, :blue], 2
sleep 0.5

print "Blinking SOS...\n"
rgb.blink :red, 3, 0.25, 0.25
sleep 1
rgb.blink :red, 3, 0.5, 0.25
sleep 1
rgb.blink :red, 3, 0.25, 0.25
