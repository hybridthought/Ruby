#Super Class
class Animal
  attr_reader :name  
  
  def initialize(name)
    @name = name
  end
  
  def speak
    #No Default
  end
end

class Bird < Animal

end

#Module (Like a java interface where you can actuly define the methods)
module FlyingAnimal
  def fly
    puts "Flap, Flap, Flap"
  end
end

#Class That Extends Animal.
#Notice that the "<" operator indates extends.
class Sparrow < Bird
  #Example of a module.
  #This is kind of like implements, but because Ruby is dynamic it injects the flying animal class into the this class.
  include FlyingAnimal
  
  def speak
    puts "Tweet tweet!"
  end
end

class Bat < Animal
  include FlyingAnimal
end

class Robin < Bird
  include FlyingAnimal
  def speak
    puts "Chirp, Chirp"
  end
end

#Class That Extends Animal.
#Notice that the "<" operator indates extends.
class Lion < Animal
  def speak
    puts "Roar!!!!"
  end
end

#Sample Invocation
puts "[Lion Object]"
my_lion = Lion.new "Leo"
puts my_lion.name
my_lion.speak 
puts "--------"

puts "[Sparrow Object]"
my_sparrow = Sparrow.new "Dove"
puts my_sparrow.name
my_sparrow.speak
my_sparrow.fly
puts "--------"

puts "[Robin Object]"
my_robin = Robin.new "Robin"
puts my_robin.name
my_robin.speak
my_robin.fly
puts "--------"

puts "[Bat Object]"
my_bat = Bat.new "Bat"
puts my_bat.name
my_bat.speak
my_bat.fly
puts "--------"

puts "[Robin's Superclass]"
puts Robin.superclass
puts "--------"

puts "[Sparrow's Superclass]"
puts Sparrow.superclass
puts "--------"

puts "[Lion's Superclass]"
puts Lion.superclass
puts "--------"

puts "[Bat's Superclass]"
puts Bat.superclass
puts "--------"

puts "[Robin Class Hierarchy]"
puts Robin.ancestors
puts "--------"

puts "[Sparrow Class Hierarchy]"
puts Sparrow.ancestors
puts "--------"

puts "[Lion Class Hierarchy]"
puts Lion.ancestors
puts "--------"

puts "[Bat Class Hierarchy]"
puts Bat.ancestors
puts "--------"