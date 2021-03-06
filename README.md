# Raspberry_Pi_IoT

A Ruby library for IoT (physical computing) projects with Raspberry Pi.

## Why I made it.

I'm a software developer and a maker. And I do love Raspberry Pi - 
it's such a fun to do physical programming! But I love to program in Ruby. 
So I tried to make a pragmatic set of useful IoT libraries for the Ruby language 
for all who want to program for Raspberry Pi in Ruby.

This gem is an interfacing library for other Ruby gems that work with different devices 
on SBCs of Raspberry Pi family.

I taught sachoolchildren in a Raspberry Pi Code Club to write OO-programs that
interact with physical devices. And I found Ruby to be a very effective tool
in teaching IoT programming.

## Installation

To use this library you should do:

1. Install the Ruby development version (to compile the extensions):
```
   sudo apt-get install ruby-dev
```
2. Download and install the bcm2835-1.xx.tar.gz library, e. g.:
```
   wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.58.tar.gz

   tar zxvf bcm2835-1.58.tar.gz
   cd bcm2835-1.58
   ./configure
   make
   sudo make check
   sudo make install
```

3. For some external gems additional libraries should be installed.

   a) to use output on a SSD1306 display with the help of the 'SSD1306' gem you'll need to 
```
   sudo apt-get install libmagickwand-dev
```

4. Install the latest version of gem:
```
   gem install raspberry_pi_iot
```

## Usage

Main classes with examples of usage are described [here](./DESCRIPTION.md).
Samples of usage can be run in the demo/ sub-directory.

## Plans:

* Support for [more devices](./supported_devices.md) (I2C, SPI, LED strip & matrix), SenseHAT, Official Display (brightness, orientation).

* Better functionality for existing classes (Button, LED, etc.)

* More tests and demos.


## Contributing

Bug reports are welcome on GitHub at https://github.com/mike-shock/Ruby-Raspberry_Pi_IoT.


## License

The gem is available as open source under the terms of the [MIT License] (https://opensource.org/licenses/MIT).
