# Raspberry_Pi_IoT

**Raspberry_Pi_IoT** is a Ruby library for physical computing projects using Raspberry Pi,
which are often referred to as IoT.

## Receptors and Effectors.

All the connected devices are traditionally divided into 2 main groups of classes:
```
(IoT device)
   |
   |-----Receptor (Sensor) ~ some thing that can sense something from the outer world.
   |
   +-----Effector (Actuator) ~ some thing that can effect something in the outer world.
```
Sometimes both of these roles could be combined in one multi-component device like **Sense HAT**.


### Digital Receptors and Effectors.

Commonly a device may use several GPIO pins to interact with your Raspberry Pi. 
And nowadays the pins of all the Raspberry Pi models are digital: HIGH and LOW electrical signals are used
to designate 1 and 0. These signals are interpreted as TRUE and FALSE 
when they are read from an external device via the pins configured as INPUT. 
Or they mean ON and OFF when they are sent to an external device via the pins configured as OUTPUT.

```
(IoT device)
   |
   |-----Receptor
   |     |
   |     +-----DigitalReceptor ~ sends signals to Raspberry Pi via a set of GPIO pins.
   |
   +-----Effector
         |
         +-----DigitalEffector ~ receives signals from Raspberry Pi via a set of GPIO pins.
```
For example you can control a **KY-016** module which has a 3-color RGB LED and is connected 
to your Raspberry Pi using 3 GPIO pins.
You can send commands for switching on or off the desired color:
```
 require "iot/led_rgb"

  rgb = IoT::LED::RGB.new(17, 27, 22) # BCM numbers of pins connected to R, G, B contacts of KY-016
  rgb.on :red;   sleep 0.25
  rgb.on :green; sleep 0.25
  rgb.on :blue;  sleep 2
  rgb.off :all

```

### Binary Receptor / Effector

Many devices have only 2 states: switched on or off, and they can report about their state 
using only 2 binary values.

```
(IoT device)
   |
   |-----Receptor
   |     |
   |     +-----DigitalReceptor
   |           |
   |           +-----BinaryReceptor ~ sends a TRUE/FALSE signal to Raspberry Pi via a single GPIO pin.
   |
   +-----Effector
         |
         +-----DigitalEffector
   |           |
   |           +-----BinaryEffector ~ receives an ON/OFF signal from Raspberry Pi via one GPIO pin.
```
For example you can control a simple LED which is connected to some GPIO pin
by sending commands to switch it on or off:

```
  require 'iot/led'

  led = IoT::LED.new(18)
  led.on
  sleep 1
  led.off
```

### Receptors / Effectors with digital interfaces.

If a device interacts with your Raspberry Pi via some standard interface (I2C, SPI, 1-wire, etc.), 
then you should connect it to the known pins and probably pass the needed parameters for object constructor
(I2C device address, bus number, system file name, etc).
