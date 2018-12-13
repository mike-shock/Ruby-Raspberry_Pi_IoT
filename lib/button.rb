require 'binary_receptor'

# Button - simple push button
class Button < BinaryReceptor
  attr_writer :measure_pause

  def initialize(pin)
    receptor_name = 'BUTTON'
    super(pin)
    @measure_pause = 0.01
    @long_click = 1.0
    @short_interval = 0.2
    @intervals = []
  end

  # Is button pressed?
  def pressed?
    low?
  end

  # Is button not pressed?
  def not_pressed?
    high?
  end

  # Wait for the 1st pressing of button
  def wait_for_press
    wait_for_presses(1)
  end

  # Wait for several sequential presses
  def wait_for_presses(attempts=2)
    @intervals = []
    attempts.times do
      interval = []
      timer = Time.now
      while not_pressed? do
        sleep @measure_pause
      end
      interval << Time.now-timer
      timer = Time.now
      while pressed? do
        sleep @measure_pause
      end
      interval << Time.now-timer
      @intervals << interval
    end
    @intervals
  end

  # Was the button pressed once?
  def single_press?(intervals=@intervals)
    intervals.size == 1
  end

  # Was the button pressed twice?
  def double_press?(intervals=@intervals)
    intervals.size == 2 && intervals[1][0] <= @short_interval
  end

  # Was the button pressed 3 times?
  def triple_press?(intervals=@intervals)
    intervals.size == 3
  end

  # Was the button pressed for more than @long_click?
  def long_press?(intervals=@intervals)
    intervals.size == 1 && intervals[0][1] >= @long_click
  end
end
