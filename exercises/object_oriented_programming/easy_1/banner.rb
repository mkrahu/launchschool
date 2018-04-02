#!/usr/bin/env ruby -wKU
# banner.rb

class Banner
  PADDING = 4

  def initialize(message, width=nil)
    @message = width.nil? ? message : message.center(width - PADDING)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :message, :width

  def horizontal_rule
    "+-" + '-' * message.length + '-+'
  end

  def empty_line
    "| " + ' ' * message.length + ' |'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 70)
puts banner

puts

banner = Banner.new('')
puts banner