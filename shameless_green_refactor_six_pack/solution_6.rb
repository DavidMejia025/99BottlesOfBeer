%Q(
Code is ok to  be done in a procedural way when it is not affected by changes, but when they occur 
the cost of a change can increase considerable so its better to think twice when deciding to 
make the first implementation.

 S O L I D  principels:

 S ingle Responsability

 O pen Close principle, states that code must be open to new code but close for modifications

 When it comes to 99 bottles sheamles solution is asked to add a siz pack name instead of #6.
 That change will produce a two new case statements which smells bad.

 So this code is NOT open to new requirements and a refactor to guarantee them is necessary. 

 (1)   if code is open 
 (2)     apply changes
      elsif if you know how to make it open 
        make it open
        go to (2)
      else 
        ask what is wrong, detect smells so
        remove the easiest to fix/best understood smell
        go to(1)
      end

The process of modify code to allow openes and imporvement is called refactor and it is well documented 
in the martin fowler book. It is vital to detect code smells to the apply a suitable solution
"The trick to successfully improving code that contains many flaws is to isolate and correct them one at
a time. In his Refactoring book, Martin Fowler identifies and names many common flaws, and provides
refactoring recipes to fix them. Chapter 3 (which was co-written by Kent Beck, who coined the term)
calls the flaws "code smells." Thanks to Fowler’s book, if you can identify a smell within code, you can
"

Common smells on the code 
Duplication
Classes to big

The case statement smells not entirely sure why but lets assume it smells. And duplication that is 
the most straifordward to solce.

"however, is the beauty of this technique. You don’t have to know how to solve the whole problem in
advance. The plan is to nibble away, one code smell at a time, in faith that the path to openness will be
revealed."

Refactoring formal definition: 

“
 the Refactoring external is behavior the process of the of code changing yet improves a software its internal system in structure.
 such a way that it does not alter
— Martin Fowler
Refactoring
"

When refactoring it is important to really on test since the external beheavior should remain working that means test should pass after
the refactor. If the refactor faills two alternatives could happened on the first place the implementation is not good 
enough or the tests flawes. A good advice is to change tests before the refactor and not in the middle of it.

Floking rules: Helps to find a good abstraction from duplicate code


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
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      "#{number_of_bottles(bottles: verse_num)} #{bottles(bottles:verse_num)} of beer on the wall, " +
      "#{number_of_bottles(bottles: verse_num)} #{bottles(bottles:verse_num)} of beer.\n" +
      "Take #{take_down(bottles: verse_num)} down and pass it around, " +
      "#{empty(bottles:verse_num)} #{bottles(bottles:verse_num)} of beer on the wall.\n"
    end
  end

  def last_bottle(bottles:)
    if bottles == 1
      empty(bottles: bottles)
    else
      (number_of_bottles(bottles: bottles)-1).to_s
    end
  end

  def number_of_bottles(bottles: )
    bottles
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
