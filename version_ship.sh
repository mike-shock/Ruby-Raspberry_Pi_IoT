#!/bin/bash
VERSION=`ruby -I./lib -e "require 'raspberry_pi_iot'; print RaspberryPiIoT::VERSION"`
./doc.sh

gem build raspberry_pi_iot.gemspec
gem push raspberry_pi_iot-$VERSION.gem
sudo gem install raspberry_pi_iot

git add .
git status
git commit -m "Classes are put into IoT module. Bugs in BMxSensor class fixed."
git tag v$VERSION
git push
git push --tags


