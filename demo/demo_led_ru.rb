#!/usr/bin/ruby

require "led"

светодиод = LED.создать(18)

5.times do
  светодиод.включить
  sleep 1
  светодиод.выключить
  sleep 1
end

print "Мигание...\n"
светодиод.мигать(5)
