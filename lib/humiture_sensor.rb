require 'temperature_sensor'

# HumitureSensor - combined humidity & temperature sensor
class HumitureSensor < TemperatureSensor
  @humidity = 0.0
  @temperature = 0.0

  def initialize
    @humidity, @temperature = read_data
  end

  def read_data
    [@humidity, @temperature]
  end

  # Humidity in per cents
  def humidity
    @humidity
  end

  # Temperature & humidity as a string
  def to_s
    sprintf "%5.2f°, %5.2f %%", @temperature, @humidity
  end
end

