class CircularBuffer
  class BufferEmptyException < RuntimeError; end
  class BufferFullException < RuntimeError; end

  def initialize(max_size)
    @buffer = []
    @max_size = max_size
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(item)
    raise BufferFullException if buffer_full?
    add(item)
  end

  def write!(item)
    buffer.shift if buffer_full? && !item.nil?
    add(item)
  end

  def clear
    self.buffer = []
  end

  private

  attr_accessor :buffer
  attr_reader :max_size

  def add(item)
    buffer << item unless item.nil?
  end

  def buffer_full?
    buffer.size >=  max_size
  end
end