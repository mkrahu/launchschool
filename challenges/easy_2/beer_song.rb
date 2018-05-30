class BeerSong
  def verse(number)
    case number
    when 3..99
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
        "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    when 2
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(number1, number2=number1)
    number1.downto(number2).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99,0)
  end
 
end