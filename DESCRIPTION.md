# Raspberry_Pi_IoT

**Raspberry_Pi_IoT** is a Ruby library for physical computing using Raspberry Pi,
which is often referred to as IoT programming.

## Receptors and Effectors.

All the connected devices are traditionally divided into 2 main groups of classes:
```
(IoT device)
   |
   |-----Receptor (Sensor) ~ some thing that can sense something from the real world.
   |
   +-----Effector (Actuator) ~ some thing that can effect something in the outer world.
```
Sometimes both of these roles, Receptor and Effector, could be combined in one multi-component device
like **Sense HAT**, which is equipped with sensors (temperature, humidity, pressure, joystick) 
and actuators (LED matrix).


### Digital Receptors and Effectors.

Commonly an external device may use several GPIO pins to be connected and interact with your Raspberry Pi. 
And nowadays the pins of all the Raspberry Pi models are digital: HIGH and LOW electrical signals are used
to designate logical 1 and 0. These signals are interpreted as TRUE and FALSE 
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

Many devices (such as LEds and push buttons) have only 2 states: switched on or off, 
and they can report about their state using only 2 binary values. 
And many sensors .

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

For example you can control a laser emitter which is connected to some GPIO pin
by sending commands to switch it on or off:
```
  require 'iot/binary_effector'

  laser = IoT::BinaryEffector.new(26) # BCM pin number
  laser.on
  sleep 3
  laser.off

```

Or you can control a simple LED object (which is a sub-class of BinaryEffector) 
that is connected to a certain GPIO pin by sending to it on and off commands
(calling on() and off() methods of the LED object):

```
  require 'iot/led'

  led = IoT::LED.new(18) # BCM pin number
  led.on
  sleep 1
  led.off
```

### Receptors / Effectors with digital interfaces.

Some devices use not binary but a more compicated way for communication with SBC comuters like Raspberry Pi.
It means that some electrical interface and programmatic protocol is used.
If a device interacts with your Raspberry Pi via some standard interface (I2C, SPI, 1-wire, etc.), 
then you should connect it to the known pins and pass the needed parameters for object constructor
(I2C device address, bus number, system file name, etc).

For example, you can measure the level of luminosity by asking the BH1750 light sensor
which communicates with your Pi via I2C interface:
```
  require 'iot/bh1750'

  luminosity_sensor = IoT::BH1750.new(0x23, 1) # I2C device  address and Bus number
  printf "%02d Luminosity Level: %f lx\n", n, luminosity_sensor.read
```
