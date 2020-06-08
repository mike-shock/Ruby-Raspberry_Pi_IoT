#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
require "iot/led"

светодиод = IoT::LED.создать(18)
printf "=== %s DEMO ===\n", 'светодиод'

t = 5
printf "Включение и выключение %d раз...\n", t
t.times do
  светодиод.включить
  sleep 1
  светодиод.выключить
  sleep 1
end

print "Мигание...\n"
светодиод.мигать(5)
