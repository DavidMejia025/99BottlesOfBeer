class Bottles

  def song
    verses(99,0)
  end

  def verses(bottles_n, bottles_n_1)
    p "#{bottles_n} #{bottles_n_1}"
    p (bottles_n_1..bottles_n)
    p i = (bottles_n_1..bottles_n).to_a.sort.reverse.map {|i| "#{verse(i)}\n"}.join("")
      i = i.chomp
  end
  
  def verse(bottles)
    last_sentence = "Take #{bottles == 1 ? "it" : "one"} down and pass it around, #{bottles == 1 ? "no more" : bottles-1}"+
   " bottle#{bottles == 2 ? "" : "s"} of beer on the wall."+ "\n" 

   verse =  "#{bottles == 0 ? "No more" : bottles} bottle#{bottles == 1 ? "" : "s"} of beer on the wall, "+
   "#{bottles == 0 ? "no more" : bottles} bottle#{bottles == 1 ? "" : "s"} of beer." + "\n"+ 
   "#{bottles == 0 ? "Go to the store and buy some more, 99 bottles of beer on the wall." + "\n": last_sentence}"
  end
end

puts Bottles.new.song