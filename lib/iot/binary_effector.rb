require_relative 'digital_effector'

module IoT
  # BinaryEffector - effector with binary logic
  class BinaryEffector < IoT::DigitalEffector
    def initialize(pin=25, state=:low)
      super({:pin => pin}, :low)
      @pin = pin
    end
  end
end
