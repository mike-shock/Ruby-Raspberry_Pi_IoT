require 'humiture_sensor'
require 'dht-sensor-ffi'

# DHT11/22 humidity & temperature sensor family
class DHTxxSensor < HumitureSensor

  def initialize(pin, sensor_model)
    @pin = pin
    @sensor_name = 'DHT'+sensor_model.to_s
    @sensor_model = sensor_model.to_i
    @temperature, @humidity = read_data
  end

  def name
    @sensor_name
  end

  # Read values by 'DhtSensor.read' from 'dht-sensor-ffi'
  def read_data
    sensor_data = DhtSensor.read(@pin, @sensor_model)
    @temperature = sensor_data.temp
    @humidity = sensor_data.humidity
    [@temperature, @humidity]
  end

end

# DHT11 - junior model, lower presicion
class DHT11 < DHTxxSensor
  def initialize(pin)
    super(pin, 11)
  end
end

# DHT11 - senior model, higher presicion
class DHT22 < DHTxxSensor
  def initialize(pin)
    super(pin, 22)
  end
end
