%Q(iBy the criteria that have been established, Shameless Green is clearly the best solution, yet almost no
one writes it. It feels embarrassingly easy, and is missing many qualities that you expect in good code.
It duplicates strings and contains few named abstractions.

)
class Bottles
  def song
    verses(0,99)
  end

  def verses(initial, final)
    final.downto(initial).each do |verse_num|
      puts  verse(verse_num)+"\r"
    end
    puts "end"
  end

  def verse(verse_num)
    case verse_num
    when 0
      verse = "lyric 0" 
    when 1 
      verse = "lyric 1" 
    when 2 
      verse = "lyric 2"
    else
      verse = verse_num.to_s      
    end

    verse    
  end
end

puts Bottles.new.song
