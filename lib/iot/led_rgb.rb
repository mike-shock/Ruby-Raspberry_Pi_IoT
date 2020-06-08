require_relative 'led'

module IoT
  class LED
    class RGB < IoT::DigitalEffector
      @red   = nil # GPIO pins
      @green = nil #
      @blue  = nil #

      def initialize(red = 17, green = 27, blue = 22)
        super({:red => red, :green => green, :blue => blue}, :low)
        @red   = red
        @green = green
        @blue  = blue
        self.name = 'RGB LED'
      end

      def on(color=:all)
        color = :aoi if color == :aqua
        case color
        when :red
          super @red
        when :green
          super @green
        when :blue
          super @blue
        when :yellow
          super @red
          super @green
        when :aoi
          super @blue
          super @green
        when :all
          super @red
          super @green
          super @blue
        else
        end
      end

      def off(color=:all)
        color = :aoi if color == :aqua
        case color
        when :red
          super @red
        when :green
          super @green
        when :blue
          super @blue
        when :yellow
          super @red
          super @green
        when :aoi
          super @blue
          super @green
        when :all
          super @red
          super @green
          super @blue
        else
          all_off
        end
      end

      def all_on
        on :all
      end

      def all_off
        off :all
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
end
