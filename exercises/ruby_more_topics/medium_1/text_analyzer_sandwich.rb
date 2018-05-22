# text_analyzer_sandwich.rb


class TextAnalyzer
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def process
    File.open(file, 'r') do |file|
      yield(file.read)  
    end
  end
end

analyzer = TextAnalyzer.new('sample_text.txt')
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split.count} words" }

puts

analyzer = TextAnalyzer.new('other_text.txt')
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split.count} words" }