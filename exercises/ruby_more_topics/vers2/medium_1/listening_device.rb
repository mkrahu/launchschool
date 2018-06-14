class Device
  attr_reader :recordings

  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts recordings.last
  end

  def record(recording)
    @recordings << recording
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
