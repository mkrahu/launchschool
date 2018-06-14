class TextAnalyzer
  def process
    File.open('sample_text.txt', 'r') do |f|
      text = f.read
      yield(text)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts  "#{text.count("\n") + 1 } lines" }
analyzer.process { |text| puts  "#{text.split.size} words" }