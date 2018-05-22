# listening_device.rb

class Device
  def initialize
    @recordings = []
  end

  def listen
    message = yield if block_given?
    record(message) if message
  end

  def record(recording)
    @recordings << recording
  end

  def play
    @recordings.last
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"