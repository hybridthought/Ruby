#Sample Class Definition
class Task
  
  #Initialize (Essentially a constructor)
  #On "new" instantciation, ruby fires off this method.
  def initialize(note)
    puts "Initialized Task with #{note}"
    
    #Here we are setting the passed in value note to an instance variable @note
    #The '@' indicates that this is a class variable. It lives as long as the object instance is alive.
    #Because Ruby is dynamic you don't need to define the class variables up top like you do in java.
    @note = note
  end


#The Following code is a getter and setter difinition for an instance variable
#This is a traditionl style you may be familiar with in Java.
=begin  
    #Method Definition
    def note
      @note
    end

    #Setter Method
    #Ruby has a convention where you can create methods with the '=' in the name.
    def note= value
      @note = value
    end
=end

#The above is fine and valid, but Ruby supports special methods that automatically generate getters and setters.
#This concept is new to you. In Java you define a class and it never changes.
#In Ruby the definition of the class can be changed on the fly. This is IMPORTANT.
#As you can see here we are calling a method called "attr_accessor" that takes a ":" symbol.
#This method tells Ruby to generate a getter and setter method on this object with the name of the ":" symbol passed.
#You can think of it as dynamic reflection.  Hence symbols makes a little more sense.
#When you are using a ":" symbol you are almost indicatting that ruby will do some dynamic method generation with that name.
#NOTE: You can pass in X many symbols ino the 'attr' methdos to generate all your methods.
  attr_accessor :note, :creator
  
#Below are samples of a 'attr_writer' which just tells ruby to dynamically define only a setter.  
=begin
  attr_writer :creator
=end
  
#Here 'attr_reader' is only defining a getter.  
=begin
  attr_reader :creator
=end
  
end

#Sample Class Instanciation
my_task = Task.new "Clean the kitchen"

#The code below looks like a we are seeting and instance variable on an object directly when in actuallity it is not.
#By default you can't access the values instance because Ruby truly encapsulates an objects instance variable. 

#NOTE: This looks like an assignment but it's really a method.  
#SEMANTIC: my_task.note=("Clean the garage")
my_task.note = "Clean the garage"
puts my_task.note

my_task.creator = "Daniel"
puts my_task.creator