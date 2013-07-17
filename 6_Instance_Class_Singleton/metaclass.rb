#Ruby has several ways to define a class method. (Like a static java method)
#Below are 3 differnt approches that achieve the same effect.
#The 3rd method is perfered, but this will serve as an example of what Ruby can do to help you think outside the box.

#Example 1
#Here you can see that you can define the class method outside the actual class.
#This seems a bit unsual at first but it works.
#(This works probably because Ruby seems to treat everything as methods, so ruby is just matching the signature of a static call.)
=begin
class Person
  
end

def Person.count
  6700000000
end
=end

#Example 2 (Using Self)
#Here you can see we are using the self approache.
#(In a way it seems this is like Example1 in that calling self will resolve to Person)
#This again gives me the impression that Ruby is just looking for a matching method signature.
=begin
class Person
  def self.count
    6700000000
  end
end
=end

#Example 3.
#This approache is used alot, though it can be confusing to understand at first.

#As you know Ruby is a dynamic language, it gives you the ability to redefine a class on the fly.
#But how this is done?
#As you can see from above the class Person has a hierarchy
# Person -> Object -> Kernal

#But what Ruby doesnt show you are metaclasses.def metaclasses.
#They are classes that can exist on the fly inbetween the hieracy which can hold the on the fly method definitions.
#Person -> MetaPerson -> Object -> MetaObject -> Kernal

#The '<<' operator is a method of Class that allow your to access the meta classes so you can define them on the fly.
#So now lets look at the class and see if it makes sense.

#Here we are redefining the meta class for self (this) class. In this case person.
class Person
  #Within this context, self represents the PersonClass
  puts self
  
  #Here we are defining the definition of the MetaClass
  class << self
    #Within the contectof the meta class definition the object is the Person MetaClass.
    puts self
    def count
      6700000000
    end
  end
end

#Before this can make sense, lets understand something important thorugh examples.
#Lets define and object of type Person.
x = Person.new

#Now lets looks at the instance 'x' and find out what it's class is.
puts "\n[WHAT TYPE OF CLASS IS 'x'?]\n"
puts x.class

#'x' is an object of type Person.
#Lets look at the ancestors of class Person.
puts "\n[ANCESTORS HIERARCY OF PERSON]\n"
puts x.class.ancestors

#Person it self is an object as well. Lets see what type.
puts "\n[WHAT TYPE OF CLASS IS 'PERSON'?]\n"
puts x.class.class

#The class Person is of Type Class.
#So lets see what ancestory it has.
puts "\n[ANCESTORS HIERARCY OF 'Class']\n"
puts x.class.class.ancestors

puts Person.count


#So now that we know about the  meta class, lets prove that we defined count at the metaclass by looking at the methods of person and then metaperson.
puts "[Person Methods]"
puts Person.instance_methods false

#Simple one line example of accessing a meta class for Person.
#In this case the ';' break up the lines of the lass definition.
metaclass = class << Person; self; end

#Lets Looks At The MetaClass Name For Person.
puts "\n[Meta Person Methods]"
puts metaclass.instance_methods false


  #Bottom line, with meta classes, we can redfine things on teh fly and squeeze them into the hiercy chain.