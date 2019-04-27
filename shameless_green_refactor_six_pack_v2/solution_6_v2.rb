%Q(
Following Book directions a mistake were found in my refactor implementation. when turning bottle/bottles to a method and abstract that beheavior the name lack in generaility specially taking into account that the goal is to open the code to extensions on six-pack. A more suitable name could be container for example. Another example could be unit but this is to higher in abstraction, there are plenty of better options in between. Always is desirable to get to the vocabulary that our clients can understand.

number |  xxx
   1   | bottle
   2   | bottles
   6   | six-pack

And the winner is: "Container is meaningful, understandable, and unambiguous." Hell yeah :}.

Another unencessary thing from the past refactor was the num of bottles method since it passes just the verse_num argument USELESS.

)
class Bottles
  def song
    verses(0,99)
  end

  def verses(initial, final)
    final.downto(initial).each do |verse_num|
      puts  verse(verse_num)+"\r"
    end
  end

  def verse(verse_num)
    case verse_num

    when 0
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      "#{verse_num} #{bottles(bottles:verse_num)} of beer on the wall.\n" +
      "#{verse_num} #{bottles(bottles:verse_num)} of beer. \n" +
      "Take #{take_down(bottles: verse_num)} down and pass it around,\n " +
      "#{last_bottle(bottles:verse_num)} of beer on the wall.\n"
    end
  end

  def last_bottle(bottles:)
    if bottles == 1
      empty(bottles: bottles)
    else
      (number_of_bottles(bottles: bottles)-1).to_s
    end
  end

  def bottles(bottles: )
     bottles == 1 ? "bottle" : "bottles"
  end

  def take_down(bottles: )
    bottles == 1 ? "it" : "one"
  end

  def empty(bottles:)
    bottles == 1 ? "no more" : bottles.to_s
  end
end
puts Bottles.new.song
