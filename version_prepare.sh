#!/bin/bash

sudo gem uninstall raspberry_pi_iot
gem build raspberry_pi_iot.gemspec
sudo gem install raspberry_pi_iot --local
rake test

