#!/bin/bash

sudo gem uninstall raspberry_pi_iot

VERSION=`ruby -I./lib -e "require 'raspberry_pi_iot'; print RaspberryPiIoT::VERSION"`

rm raspberry_pi_iot-$VERSION.gem
gem build raspberry_pi_iot.gemspec
sudo gem install raspberry_pi_iot --local
rake test

