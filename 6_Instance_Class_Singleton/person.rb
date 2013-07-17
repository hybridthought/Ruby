class Person
  attr_accessor :name

  def greet
      puts "Hello, #{self.name}!"
  end
  
  def rename name_name
    #Notice the self keyword.def keyword.
    #This indicates to Ruby that you are refring to a local variable in the object.
    #If you do not indicate self on a setter, ruby will assume you are creating a local variable whos value will be destroyed at the end of the method.

    #NOTE: Creates a local Variable "name" for the method
=begin    
    name = name_name
=end    
        
    #NOTE: Sets Class Variable "name"
    self.name = name_name
  end
  
end

friend = Person.new
friend.name = "Nick"
friend.greet

friend.rename "Dan"
friend.greet