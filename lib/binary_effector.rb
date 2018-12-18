require 'digital_effector'

# BinaryEffector - effector with binary logic
class BinaryEffector < DigitalEffector
  @pin = nil # pin

  def initialize(pin=25, state=:low)
    super({:pin => pin}, :low)
    @pin = pin
  end

end
