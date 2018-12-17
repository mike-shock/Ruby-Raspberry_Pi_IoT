#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "button"

button = Button.new(21)

printf "Waiting for press...\n", p
s = button.wait_for_press
printf "Press: %s %s %s\n", s, button.single_press?, (button.long_press? ? "Long" : "Short")

p = 2
printf "Waiting for %d presses...\n", p
s = button.wait_for_presses p
printf "Presses: %s %s\n", s, (button.double_press? ? "Double" : "2 Singles")

t = 25
printf "Testing %d times...\n", t

t.times do |n|
  value = button.pressed?
  if value
    printf "%d Button PRESSED!!!\n", n
  else
    printf "%d Button not pressed!\n", n
  end
  sleep 0.5
end

