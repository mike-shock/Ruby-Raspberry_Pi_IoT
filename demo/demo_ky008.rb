#!/usr/bin/ruby

$LOAD_PATH << "../lib" unless ARGV[0] == "gem"
  require 'iot/binary_effector'

  laser = IoT::BinaryEffector.new(26)
  printf "=== %s DEMO ===\n", laser.name

  laser.on
  p laser.on?
  sleep 3
  laser.off
  p laser.on?
  p laser.off?

