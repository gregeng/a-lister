class Timer
  attr_accessor :total_time, :time_remaining, :beg_time

  def initialize(total_time)
      @total_time = total_time
      start_timer
  end

  def start_timer
    self.beg_time = Time.now
  end

  def time_remaining
    if self.total_time - (Time.now - self.beg_time) >= 0
      self.total_time - (Time.now - self.beg_time) 
    else
      0
    end
  end

end