# Supported Devices

## IMPLEMENTED:
```
Y/N	Name		Type: R/ E	Connection	Usage Area	Description
```
### Implemented & Tested:

#### Receptors / Sensors:
```
+ BH1750		Receptor	I2C:0x23	Light		Luminocity sensor
+ BME280		Receptor	I2C:0x76	Pressure	Temperature, humidity & pressure sensor
+ BMP280		Receptor	I2C:0x76	T+H		Temperature & pressure sensor: 20-bit
+ DHT11/KY-015		Receptor	special		Humiture	Temperature & humidity sensor: integer values
+ DHT22			Receptor	special		Humiture	Temperature & humidity sensor: more precise fractional values
+ DS18B20/KY-001	Receptor	1-wire		Temperature	Temperature sensor: high precision
+ HTU21D		Receptor	I2C:0x40	Humiture	Relative Humidity & Temperature Sensor
+ MAX44009/GY49		Receptor	I2C:0x4A	Light		Luminocity sensor
+ Thermal_Sensor	Receptor	internal	Temperature	Temperature sensor on Raspberry Pi board
+ Push Button/KY-004	Receptor	1-pin				Touch sensor
```
#### Effectors / Actuators:
```
+ LED			Effector	1-pin		Light		Ordinary LED
+ LED_RGB/KY-016	Effector	3-pin		Light		3-color RGB LED module
+ KY-008		Effector	1-pin		Light		Red 650nm laser diode transmitter module
```

### Not tested:
```
~ BMP085		Receptor	I2C:0x76?	Pressure	Pressure sensor: 16..19-bit
~ BMP180		Receptor	I2C:0x77	Pressure	Pressure sensor
```

## NOT implemented:
```
 Planned to be done first:
- LED PWM		Effector	1-pin		Light		
- SSD1306		Effector	I2C/IIC		Display		0.91" 128x32 Blue OLED LCD Display module

 sensors:
- ADT7410i		Receptor	I2C		Temperature	Temperature sensor: ±0.5°C Accurate, 16-bit Digital
- D6T-44LI		Receptor	I2C		IR		MEMS IR sensor 
- grid-eyei		Receptor	I2C		IR		Panasonic Grid-EYE Infrared Array Sensor
- HDC1000i		Receptor	I2C		Humiture	Low Power, High Accuracy Digital Humidity Sensor with Temperature Sensor
- MPL115a2i		Receptor	I2C		Pressire	I²C Barometric Pressure/Temperature Sensor
- Si70xxi		Receptor	I2C		Humiture	Relative Humidity and Temperature Sensor family
- TL1838		Receptor			IR		IR flame sensor

- U-blox 7 GPS/Glonass	Receptor	USB?		Positioning	Sattelite Navigation Receiver

- WS2801 LED/SMD 5050	Effector	?		Light		addressable full-color RGB light module
- WS2802 LED strip	Effector	SPI		Light		addressable full-color RGB light module
- WS2812 8 LED Line	Effector	1-pin		Light		addressable full-color RGB light module
- WS2812 8 LED Ring	Effector	1-pin		Light		addressable full-color RGB light module
- WS2812 12 LED Ring	Effector	1-pin		Light		addressable full-color RGB light module
- WS2812 LED Matrix	Effector	1-pin		Light		addressable full-color RGB light module

- ACM1602ni		Effector	I2C		Display		LCD Controller: 5V, 2 lines x 16 characters
- AQM0802i		Effector	I2C		Display		LCD display 
- HD44780i		Effector	I2C		Display		LCD display
- MAX7219		Effector	I2C?		Display		Dot Matrix Module 
- Official Touch Screen	Effector			Display		Official Raspberry Pi 7" 800×480 Touchscreen Display
- PiTFT Plus 3.5"	Effector			Display		
- QC1620A/HD44780	Effector			Display		LCD 16x2 (16 characters wide, 2 rows) display
- SH5461AS		Effector			Display		0.56" 7 Segment 4 Digit common anode red LED digital display
- WH1602		Effector			Display		LCD display
- XPT2046		Effector	SPI		Display		Waveshare 3.5" 320*480 LCD TFT Touch Screen Display with Stylus

- Pi Camera V2		R+E				Camera		Raspberry Pi 5MP 2592 x 1944 Camera Module
- Pi NoIR Camera V2	R+E				Camera		Raspberry Pi NoIR Camera Module

- Sense HAT		R+E		HAT:I2C		Combine		LED matrix + T,H,P sensor + hyroscope + Joystick
- PoE HAT		R+E		HAT		Power		Official Power over Ethernet (PoE) HAT
- Flick HAT		Receptor	HAT:i2C		Position	Flick - 3D Gesture Sensor HAT
- FlickZero pHAT	Receptor	HAT:i2C		Position	Flick Zero - 3D Gesture Sensor pHAT
- WaveShare Pioneer600  R+E		HAT		Combine		2 LED, joystick, buzzer, 0.96" OLED, RTC: DS3231, AD/DA: PCF8591, IR: LFN0038K, BMP180, DS18B20
- U-Geek Stepper Motor	Effector	HAT		Motor		4 H-Bridges: TB6612, 4 bi-directional DC motors, 2 stepper motors, 4 Channel 12-bit PWM/Servo(5V), 1 IR Receiver
- 2.7_HAT_B		Effector	HAT:SPI		Display		WaveShare 2.7" 264x176 3-color (white, black, red) e-Paper/e-ink display HAT
- 2.13_HAT		Effector	HAT:SPI		Display		WaveShare 2.13" 250x122 2-color(white, black) e-Paper/e-Ink display HAT
```
## Popular Sensor Sets
```
 16in1 set:
- KY-018		Receptor			Light		Photosensitive resistance sensor module
- KY-026		Receptor			IR		Flame sensor module
- SW-460D		Receptor					Tilt angle sensor module
- SW-420		Receptor					Vibration sensor module
- 86009			Receptor			IR		Infrared obstacle avoidance sensor
+ KY-008		Effector			Light		Red 650nm laser diode transmitter module
- KY-037/LM393		Receptor			Sound		Sound Microphone sensor module
+ DHT-11		Receptor			Humiture	Temperature & Humidity sensor module
- HC-SR04		Receptor					Ultrasonic sensor
- HC-SR501		Receptor			IR		Infrared human body induction PIR module
- MQ-2			Receptor			Gas		Gas wide-range sensor module
- MX-FS-03V						Radio		315 MHz Wireless Super-Regenerative RF Module
- YL-69			Receptor					Soil Moisture sensor
- KY-033/TCRT5000	Receptor			IR		IR Path Tracing / Line Tracking module
- DS1302		Receptor			Clock		Real-Time Clock (RTC) module
- FZ0828		Receptor					Rain-drop sensor module

 37in1 set:
+ KY-001		Receptor	1-wire		Temperature	DS18B20 temperature sensor module
- KY-002		Receptor	1-pin		Movement	Vibration / shock switch module: HIGH = vibration detected
- KY-003		Receptor	1-pin				Hall magnetic sensor module: HIGH = magnetic field detected
+ KY-004		Effector	1-pin		Switch		Mechanical Key switch / push button module: HIGH = pressing detected
- KY-005		Effector	?		IR		Infrared (IR) transmitter / emission module: TV control codes
- KY-006		Effector	1-pin		Sound		Small passive buzzer module: HIGH = sound ON, LOW = sound OFF
+ KY-008		Effector	1-pin		Light		Red 650nm laser diode transmitter module
- KY-009		Effector	3-pin		Light		3-color full-color RGB LED 5050 SMD module
- KY-010		Receptor	1-pin		Light		Optical photo interrupter/light blocking module: HIGH = signal interruption detected
- KY-011		Effector			Light		2-color 5mm green+red LED module
- KY-012		Effector	1-pin		Sound		Active buzzer 5V module
- KY-013		Receptor	Analog		Temperature	Analog temperature sensor
+ KY-015		Receptor	Special		Humiture	Temperature and humidity digital sensor DHT11
+ KY-016		Effector	3-pin		Light		3-color RGB LED module
- KY-017		Receptor	1-pin				Mercury open optical tilt switch module: HIGH = tilt detectted
- KY-018		Receptor	Analog		Light		Photo-resistor / light sensor module
- KY-019		Effector	1-pin		Switch		5V 1-channel relay module: LOW = relay switch is turned off
- KY-020		Receptor	1-pin				Ball / tilt switch module: HIGH = tilt detectted
- KY-021		Receptor	1-pin				Mini magnetic reed switch (hermetic contact): HIGH = signal detected
- KY-022		Receptor			IR		IR 38 Khz VS1838B receiver / remote control
- KY-023		Receptor			Movement	XY-axis+button joystick (PS2 gamepad) module
- KY-024		Receptor	1-pin+A				Linear magnetic Hall sensor module: HIGH = magnetic signal detected
- KY-025		Receptor	1-pin				Reed (hermetic contact) module: HIGH = signal detected
- KY-026		Receptor	1-pin+A				Flame detector LM393 sensor module: HIGH = signal detected
- KY-027		Receptor			Light		2 x Magic light cup modules
- KY-028		Receptor	1-pin		Temperature	Digital temperature sensor module: HIGH = temperarure threshold detected
- KY-029		Effector			Light		Yin Yi 2-color 3mm green+red mini-LED module
- KY-031		Receptor	1-pin				Knock / tap / hit switch sensor module: HIGH = knock detected
- KY-032		Receptor	1-pin				Obstacle avoidance infrared (IR T+R) sensor: HIGH = obstacle detected
- KY-033		Receptor	1-pin				Line tracking / hunt sensor module: HIGH = line detected
- KY-034		Effector	1-pin		Light		7-color automatically flashing LED module: HIGH = set the LED on
- KY-035		Receptor	A				Analog Hall / Class Bihor magnetic sensor
- KY-036		Receptor	1-pin				Metal touch sensor module: HIGH = metal touch detected
- KY-037		Receptor	1-pin+A		Sound		High sensitivity sound detection microphone: HIGH = sound threshold detected
- KY-038		Receptor	1-pin+A		Sound		Microphone sound sensor module: HIGH = sound threshold detected
- KY-039		Receptor	A		IR		Heartbeat detector finger measuring module
- KY-040		Receptor	D		Rotation	Rotary encoder module
```
