class SecretHandshake
  HANDSHAKES = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(number)
    case number
    when String
      if number.to_s =~ /^[0-1]+$/ && number.length <= 5
        @binary = number
      else
        @binary = '0'
      end
    when Integer
      @binary = number.to_s(2)
      @binary = '0' if @binary.length > 5
    else
      @binary = '0'
    end
  end

  def commands
    handshakes = @binary.reverse.chars.map.with_index do |num, index|
      if num == '1'
        HANDSHAKES[index]
      else
        num
      end
    end

    handshakes = handshakes.select { |shake| HANDSHAKES.include?(shake) }
    if @binary[0] == '1' && @binary.length == 5
      handshakes.reverse
    else
      handshakes
    end
  end
end

handshake = SecretHandshake.new(2)
p handshake.commands