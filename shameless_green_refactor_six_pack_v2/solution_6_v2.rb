%Q(
Following Book directions a mistake were found in my refactor implementation. when turning bottle/bottles to a method and abstract that beheavior the name lack in generaility specially taking into account that the goal is to open the code to extensions on six-pack. A more suitable name could be container for example. Another example could be unit but this is to higher in abstraction, there are plenty of better options in between. Always is desirable to get to the vocabulary that our clients can understand.

number |  xxx
   1   | bottle
   2   | bottles
   6   | six-pack

And the winner is: "Container is meaningful, understandable, and unambiguous." Hell yeah :}.

Another unencessary thing from the past refactor was the num of bottles method since it passes just the verse_num argument USELESS.
This was true in the first place but since the number changed and turn into a string at some point abstract the number into a method
was actually a good idea.

for the refactor there is a procedure where you.
detect what smells bad
choose one single thing to improve so avoid one repeted word or abstract one beheavior.
start by removing the common patter
create a new method that will encapsulate the diference
set a default value for the method
try by adding one argument with default temporary value
make the new method work for one case
open the method to be able to work with other cases.
add arguments to the sender
test one method
and finally test the complete method (refactor).

Another alternative is to derive names from responsabilities: Phrase four is the final phrase of the song where the number gets decremented, and so the argument is always number-1 . It’s tempting, therefore, to think of "no more" and #{number-1} as representing
the number of bottles that remain once a verse is complete."

Unbelievably i didnt even noticed the No more... capitalization on the first line of the zero scenario :'(.
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
      "#{container_num(number: verse_num).capitalize} #{verse_num} #{container(container:verse_num)} of beer on the wall.\n"+
      "#{container_num(number: verse_num)} #{container(container:verse_num)} of beer. \n" +
      "#{next_action(container: verse_num)}"+
      "#{next_container_num(number: verse_num)} #{container(container:verse_num -1)} of beer on the wall.\n"
    else
      "#{container_num(number: verse_num)} #{container(container:verse_num)} of beer on the wall.\n" +
      "#{container_num(number: verse_num)} #{container(container:verse_num)} of beer. \n" +
      "#{next_action(container: verse_num)}"+
      "#{next_container_num(number: verse_num)} #{container(container:verse_num -1)} of beer on the wall.\n"
    end
  end

  def next_action(container: )
    return "Go to the store and buy some more, \n" if container == 0
    "Take #{pronoun(container: container)} down and pass it around,\n "
  end


  def container_num(number:)
    return "no more" if number == 0

    number
  end

  # books solution: remainder actually remainder was not a very good option because in the first line of the the song No more bottles is not a reminder is the current number of the verse.
  # a new option is quantity.
  #
  def next_container_num(number:)
    return 99 if number == 0

    if number == 1
      "no more"
    else
      number-1
    end
  end

  def last_bottle(container:)
    if container == 1
      empty(container: container)
    else
      (container-1).to_s
    end
  end

  def container(container: )
     container == 1 ? "bottle" : "bottles"
  end

  def pronoun(container: )
    container == 1 ? "it" : "one"
  end

  def empty(container:)
    container == 1 ? "no more" : container.to_s
  end
end
puts Bottles.new.song
