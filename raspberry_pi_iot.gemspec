#require "Raspberry_Pi_IoT/version"
lib = File.expand_path("./lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = "raspberry_pi_iot"
  spec.version     = "0.0.11"
  spec.date        = "2020-06-03"
  spec.authors     = ["Mike Shock (Mikhail V. Shokhirev)"]
  spec.email       = "mshock25@gmail.com"
  spec.summary     = "IoT library for Raspberry Pi projects in Ruby"
  spec.description = "A set of classes for IoT (Internet of Things) / physical computing with Raspberry Pi"
  spec.license     = "MIT"
  spec.files       = Dir["lib/*"] + Dir["doc/*"] + Dir["test/*"]
  spec.homepage    = "https://github.com/mike-shock/Ruby-Raspberry_Pi_IoT/"

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency "bundler",  "~> 1.17"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "yard",     "~> 0.9.16"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency "rpi_gpio",       "~> 0.3.3", ">= 0.3.3"
  spec.add_runtime_dependency "i2c-devices",    "~> 0.0.6", ">= 0.0.6"
  spec.add_runtime_dependency "i2c",            "~> 0.4.2", ">= 0.4.2"
  spec.add_runtime_dependency "i2c-bme280",     "~> 0.1.2", ">= 0.1.2"
  spec.add_runtime_dependency "dht-sensor-ffi", "~> 0.2.0", ">= 0.2.0"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
#  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
end
