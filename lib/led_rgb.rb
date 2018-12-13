require 'led'

class LED
 class RGB < DigitalEffector
  @red   = nil # GPIO pins
  @green = nil #
  @blue  = nil #

  def initialize(red = 17, green = 27, blue = 22)
    super({:red => red, :green => green, :blue => blue}, :low)
    @red   = red
    @green = green
    @blue  = blue
  end

  def red_on
    DigitalEffector.on @red
  end

  def red_off
    DigitalEffector.off @red
  end

  def green_on
    DigitalEffector.on @green
  end

  def green_off
    DigitalEffector.off @green
  end

  def blue_on
    DigitalEffector.on @blue
  end

  def blue_off
    DigitalEffector.off @blue
  end

  def on(color)
    color = :aoi if color == :aqua
    case color
    when :red
      red_on
    when :green
      green_on
    when :blue
      blue_on
    when :yellow
      red_on
      green_on
    when :aoi
      blue_on
      green_on
    else
    end
  end

  def off(color=:all)
    color = :aoi if color == :aqua
    case color
    when :red
      red_off
    when :green
      green_off
    when :blue
      blue_off
    when :yellow
      red_off
      green_off
    when :aoi
      blue_off
      green_off
    when :all
      all_off
    else
      all_off
    end
  end

  def all_off
    red_off
    green_off
    blue_off
  end


  def blink(list = :all, repeat=3, switched_on=0.25, switched_off=0.5)
    colors = (list == :all) ? [:red, :green, :blue] : (list.class == Array ? list : [list])
    repeat.times do |n|
      colors.each do |color|
        on color
        sleep switched_on
        off color
        sleep switched_off
      end
    end
  end
 end
end
