# Ruby-Raspberry_Pi_IoT
A Ruby library for IoT (physical computing) projects with Raspberry Pi.

Why I made it.

I'm a software developer and a maker. And I do love Raspberry Pi - 
it's such a fun to do physical programming! But I love to program in Ruby. 
So I tried to make a pragmatic set of useful IoT libraries for the Ruby language 
for all who want to program for Raspberry Pi in Ruby.

To use this library you should do:

1. Install the Ruby development version (to compile the extensions):
   sudo apt-get install ruby-dev

2. Download and install the bcm2835-1.xx.tar.gz library:
   wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.58.tar.gz
   tar zxvf bcm2835-1.xx.tar.gz
   cd bcm2835-1.xx
   ./configure
   make
   sudo make check
   sudo make install

3. Download the gem from this repository and install it:
   sudo  gem install ./raspberry_pi_iot.gem
   
