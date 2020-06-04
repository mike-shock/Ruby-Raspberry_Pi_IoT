#!/usr/bin/ruby

$LOAD_PATH << "../lib"
require "led"

светодиод = LED.создать(18)
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
