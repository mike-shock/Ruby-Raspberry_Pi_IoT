Gem::Specification.new do |s|
  s.name        = 'raspberry_pi_iot'
  s.version     = '0.0.6'
  s.date        = '2018-12-13'
  s.summary     = "IoT library for Raspberry Pi projects in Ruby"
  s.description = 'A set of classes for IoT (Inrternet of Things) / physical computing with Raspberry Pi'
  s.authors     = ['Mike Shock (Mikhail V. Shokhirev)']
  s.email       = 'mshock25@gmail.com'
  s.license     = 'MIT'
  s.files       = Dir["lib/*"] + Dir["doc/*"]
  s.homepage    = 'https://github.com/mike-shock/Ruby-Raspberry_Pi_IoT/'
  s.add_runtime_dependency 'rpi_gpio',       '~> 0.3.3', '>= 0.3.3'
  s.add_runtime_dependency 'i2c-devices',    '~> 0.0.6', '>= 0.0.6'
  s.add_runtime_dependency 'i2c',            '~> 0.4.2', '>= 0.4.2'
  s.add_runtime_dependency 'i2c-bme280',     '~> 0.1.2', '>= 0.1.2'
  s.add_runtime_dependency 'dht-sensor-ffi', '~> 0.2.0', '>= 0.2.0'
end
