%Q(
 1.1.3. Concretely Abstract
This solution valiantly attempts to name the concepts in the domain. Here’s the code:

Therefore, one lesson to be gleaned from this solution is that you should name methods after the
concept they represent rather than how they currently behave. However, notice that even if you edited
the code to improve every method name, this code still isn’t quite right.

Changing the name of the beer method to beverage makes it easy to replace the string "beer" with
the string "Kool-Aid" but does nothing to improve this code’s score on the domain questions. The
problem goes far deeper than having methods with inadequate names. It’s not just the names that are
wrong, but the methods themselves. Many methods in this code represent the wrong abstractions.


This solution looks for divide the problem into small pieces. First a class of bottle and verse are inplemented.
In the verse class after receiving a number of bottles the method to_s calls two functions.
)

class Bottles
  def song 
    verses(99,0) 
  end

  def verses(bottles_at_start, bottles_at_end)
    (bottles_at_start).downto(bottles_at_end).map do |bottles_number|
      verse(bottles_number)
    end.join("\n")
  end

#Round overwrites .to_s method
  def verse(bottles)
    Round.new(bottles).to_s
  end
end

class Round
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    change + response
  end

  def change
    bottles_of_beer.capitalize + " " + on_wall + ", " + bottles_of_beer  + ".\n"
  end

  def response
    go_to_the_store_or_take_one_down + ", " +
    bottles_of_beer + " " + on_wall + ".\n"
  end

   
   def bottles_of_beer
    "#{anglicized_bottle_count} #{pluralized_bottle_form} of #{beer}"
   end
   
   def beer
    "beer"
   end
   
   def on_wall
    "on the wall"
   end
   
   def pluralized_bottle_form
    last_beer? ? "bottle" : "bottles"
   end
   
   def anglicized_bottle_count
    all_out? ? "no more" : bottles.to_s
   end
   
   def go_to_the_store_or_take_one_down
    if all_out?
      @bottles = 99
      buy_new_beer 
    else
      lyrics = drink_beer
      @bottles -= 1
      lyrics
    end
   end
   
   def buy_new_beer
    "Go to the store and buy some more"
   end
   
   def drink_beer
    "Take #{it_or_one} down and pass it around"
   end
   
   def it_or_one
     last_beer? ? "it" : "one"
   end
   
   def all_out?
    bottles.zero?
   end
   
  def last_beer?
   bottles == 1
  end
end

bottles =  Bottles.new 
puts 132 
puts bottles.song
