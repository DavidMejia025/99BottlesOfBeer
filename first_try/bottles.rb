class Bottles
  attr :bottles
  def initialize
    
  end

  def song
    # song = verse(99)+"\n"

    # 99.times do |i|
    #   if i < 99
    #    song = song + verse(98-i)+"\n"
    #   else
    #    song = song + verse(0).chomp
    #   end
    # end

    # ult = "#{song}".chomp
    verses(99,0)
  end

  def verses(bottles_n, bottles_n_1)
    verses = (bottles_n_1..bottles_n).to_a.sort.reverse.reduce("") { |accu,i| accu = accu +verse(i)+"\n" }
    verses.chomp
  end

  def verse(bottles)
    if bottles == 0
      return verse_0
    else 
      p_1 = first_paragraph(bottles:bottles)
      p_2 = second_paragraph(bottles: bottles)
    end

    <<-VERSE
      #{p_1}\n#{p_2}
    VERSE
  end

  def verse_0
    <<-VERSE
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def first_paragraph(bottles: bottles)
    text = bottles == 1 ? "bottle" : "bottles"

    "#{bottles} #{text} of beer on the wall, #{bottles} #{text} of beer."
  end

  def second_paragraph(bottles: bottles)
    if bottles == 1
      return "Take it down and pass it around, no more bottles of beer on the wall."
    elsif bottles > 2
      bottles_1 = "#{bottles-1} bottles"
    elsif bottles == 2
       bottles_1 = "#{bottles-1} bottle"
    end

    "Take one down and pass it around, #{bottles_1} of beer on the wall."
  end
end

  