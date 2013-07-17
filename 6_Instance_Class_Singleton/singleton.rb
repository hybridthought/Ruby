class Person
  def greet
    puts "Hello, Friend!"
  end
end

jim = Person.new
nick = Person.new

#EXAMPLE Singleton
#Here we can see that we are, on the fly, defining a new method on the specific object reference fo nick.
#This creates a sing method in the meta class for nick.
#Think of it this way...Nick is of type Person.
#The instance nick uses that class as a template which it uses to create its meta class for the instance.
#The method below adds the sing method to that meta class customzing it.
def nick.sing
  puts "La la La!"
end

puts "\n[METHODS IN PERSON CLASS]"
puts Person
puts Person.instance_methods false

puts "\n[METHODS IN PERSON META CLASS]"
metaclass = class << Person; self; end
puts metaclass
puts metaclass.instance_methods false

puts "\n[METHODS IN JIM META CLASS]"
metaclass = class << jim; self; end
puts metaclass
puts metaclass.instance_methods false

puts "\n[METHODS IN NICK META CLASS]"
metaclass = class << nick; self; end
puts metaclass
puts metaclass.instance_methods false

puts "\n[NICK ATTEMPTS TO GREET]"
nick.greet

puts "\n[NICK ATTEMPTS TO SING]"
nick.sing

puts "\n[JIM ATTEMPTS TO GREET]"
jim.greet

puts "\n[JIM ATTEMPTS TO SING]"
jim.sing
