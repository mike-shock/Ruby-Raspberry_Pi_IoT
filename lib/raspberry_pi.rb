module RaspberryPi

  # Return the model name
  # https://www.raspberrypi-spy.co.uk/2012/09/checking-your-raspberry-pi-board-version/
  def self.model_name(source='proc')
    info = if source == 'proc'
      `cat /proc/device-tree/model`
    elsif
      `pinout | grep -Eo "Pi Model[^|]+"`
    else
      'N/A'
    end
    info.strip
  end

  # Return hardware info as a hash
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
