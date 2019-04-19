%Q(
 Speculatively generalÑ

 99 bottles of beer solution to much complex exces of abstraction 
)
%W(
  Lambdas is that they act like functions. Blocks and Procs have
  their uses. But neither of them behaves 100% like a real life 
  function. Lambdas do

    http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/
)
%W( a.call )

%W( Ampersand (&) operationr in arguments represents a block that is passed as argument e.g  
Verse.new(number, &NoMore)
)

%Q(This solution contains a Class Bottles that has a method song and calls some verses, corresponding 
    to the 99 to 0 verses of the song. Inside the verses method a verse is created from the class Verse.
    To implement this solution the author defines a set of defined verses in diferent lambdas stored as constants.
    So when a bottle is picked  the verse takes the number of bottles left and slects the correct lamda with its name. )
%Q) Pitfalls  " the verse_for method gets invoked for every verse of the song, and therefore, one
hundred instances of Verse will be created, each containing a verse number and the lambda that
corresponds to that number.")

require "pry"

class Bottles      
  def song 
    verses(99,0) 
  end

  def verses(finish,start)
    (finish).downto(start).map do |verse_number|
      Verse.new(verse_number).text
    end.join("\n")
  end

  def verse(number)
    Verse.new(number).text
  end

end

class Verse
  Nomore = lambda do |verse|
      "No more bottles of beer on the wall, no more bottles of beer."+
      "Go to the store and buy some more, 99 bottles of beer on the wall.)"
  end

  Onemore = lambda do |verse|
    " 1 "
  end

  Twomore = lambda do |verse|
    " 2 "
  end

  Default = lambda do|verse|
    "  #{verse.number} "
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def text
    case @number
    when 0
      lyric = Nomore
    when 1
      lyric = Onemore
    when 2
      lyric = Twomore
    else
      lyric = Default
    end
    lyric.call self
  end
end

bottles =  Bottles.new 
puts 23
puts bottles.song