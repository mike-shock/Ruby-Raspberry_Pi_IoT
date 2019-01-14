require 'binary_receptor'

# Button - simple tactile / push button
class Button < BinaryReceptor
  attr_writer :measure_pause

  def initialize(pin)
    receptor_name = 'BUTTON'
    super(pin)
    @measure_pause = 0.01
    @long_click = 1.0
    @short_interval = 0.2
    @timeout = 30
    @intervals = []
    # samples:        wait time    press time     wait time    press time
    # double press: [[1.486804292, 0.090814152], [0.131284967, 0.13125429]]
    # long press:   [[0.910878286, 1.109352219]]
  end

  # Is button being pressed?
  def pressed?
    low?
  end

  # Is button not being pressed?
  def not_pressed?
    high?
  end

  def was_pressed?
    @intervals.size > 0
  end

  def was_not_pressed?
    !was_pressed?
  end

  # Wait for the 1st pressing of button
  def wait_for_press
    wait_for_presses(1)
  end

  # Wait for several sequential presses
  def wait_for_presses(attempts=2, timeout=@timeout)
    @intervals = []
    attempts.times do
      interval = []
      timer = Time.now
      while not_pressed? && (Time.now-timer) < timeout do
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

  def set_timeout(timeout)
    @timeout = timeout
  end

  def timeout?
    min_wait_time = 60.0*60.0*60.00
    @intervals.each do |interval|
      min_wait_time = [min_wait_time, interval[0]].min
    end
    min_wait_time > @timeout
  end
end
