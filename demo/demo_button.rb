#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/button"

button = IoT::Button.new(21)
printf "=== %s DEMO ===\n", 'Push Button'

printf "Waiting for press...\n", p
s = button.wait_for_press
printf "Press: %s %s %s\n", s, button.single_press?, (button.long_press? ? "Long" : "Short")

p = 2
printf "Waiting for %d presses...\n", p
s = button.wait_for_presses p
printf "Presses: %s %s\n", s, (button.double_press? ? "Double" : "2 Singles")

t = 12
printf "Testing %d times...\n", t

t.times do |n|
  value = button.pressed?
  if value
    printf "%02d Button PRESSED!!! Release it...\n", n
  else
    printf "%02d Button not pressed. Press it...\n", n
  end
  sleep 0.5
end

