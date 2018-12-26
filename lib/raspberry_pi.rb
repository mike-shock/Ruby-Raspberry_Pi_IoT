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

  # Return host name as a string
  def self.host_name
    `hostname`.chomp
  end

  # Return host ip-addresses as an Array
  def self.host_ip
    `hostname -I`.chomp.split " "
  end

  # Return used and free disk space in KB on a file system or on all (with '*')
  def self.disk_space(mounted='/', hash=false)
    disk_memory = []
    lines = `df -k`
    lines.split("\n").each do |line|
      disk_memory << line.chomp.split(" ")
    end
    disk_memory.shift # deleie 1st array with titles

    if mounted == '*'
      return hash ? self.matrix2hash(disk_memory) : disk_memory
    else
      disk_memory.each do |fs|
        if fs[-1] == mounted
          return hash ? self.list2hash(fs) : fs
        end
      end
    end
  end

private
  def self.list2hash(a)
    {:file_system=>a[0], :size=>a[1].to_i, :used=>a[2].to_i, :free=>a[3].to_i, :procent=>a[4].to_f, :mounted=>a[5]}
  end

  def self.matrix2hash(m)
    h = {}
    m.each do |a|
      h[a[-1]] = self.list2hash(a)
    end
    h
  end
end
