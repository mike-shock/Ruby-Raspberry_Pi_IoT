#!/bin/bash
VERSION=0.0.9
./doc.sh

gem build raspberry_pi_iot.gemspec
gem push raspberry_pi_iot-$VERSION.gem
sudo gem install raspberry_pi_iot

git add .
git status
git commit -m "Some bugs fixed."
git tag v$VERSION
git push
git push --tags


