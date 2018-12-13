module RaspberryPi
# https://www.raspberrypi-spy.co.uk/2012/09/checking-your-raspberry-pi-board-version/

  # Pi Model 3B V1.2
  def self.pi_model_old
    info = `pinout | grep -Eo "Pi Model[^|]+"`
    info.strip
  end

  def self.pi_model
    info = `cat /proc/device-tree/model`
    info.strip
  end

  # Revision           : a22082
  # SoC                : BCM2837
  # RAM                : 1024Mb
  # Storage            : MicroSD
  # USB ports          : 4 (excluding power)
  # Ethernet ports     : 1
  # Wi-fi              : True
  # Bluetooth          : True
  # Camera ports (CSI) : 1
  # Display ports (DSI): 1
  def self.hardware_info
    info = {}
    lines = ` pinout | grep ': '`
    lines << `cat /proc/cpuinfo | grep ': '`
    lines.split("\n").each do |line|
      key, value = line.split(':')
      key.strip!
      if key == 'processor'
        value = (value.to_i+1).to_s
        key = 'Cores'
      end
      key = 'CPU name' if key == 'model name'
      info[key] = value.strip
    end
    info
  end
end
