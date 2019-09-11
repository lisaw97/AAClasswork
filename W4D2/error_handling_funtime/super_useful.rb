# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError => err
  puts "This is not a number"
  puts "Error was #{err}"
  nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue StandardError => e
  if maybe_fruit == "coffee"
    puts "that's not a fruit"
    retry
  end
  raise "Invalid fruit. Error was #{e}"
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Name can't be empty." if name.length <= 0
    @name = name
    raise "Cannot be best friends!!!! I've known you for less than five years." if yrs_known < 5    
    @yrs_known = yrs_known
    raise "Pastime has to be greater than zero." if fav_pastime.length <= 0
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


