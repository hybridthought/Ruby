#The concept of modules is a lot like java packages.
#They are used to organize classes, as well as distinguish between classes of similar name.

#Here we define a module called 'FightingGameWebsite' that respresents differnt fighing game websites.
module FightingGameWebsite
  
  #Inside this module (or package if you will) we have a class classed "Srk"
  class Srk
    def initialize
      puts "www.shoryuken.com"
    end
  end
end

#Here we have a module called 'Ryu' That represents aspects of the character.
module Ryu
  
  #NOTE: You can define constants in modules like so. They can be accesed from the module using the '::' operator.
  VERSION = "Evil Ryu"
  
  #Inside this module (or package if you will) we have a class classed "Srk" which represents Ryus Dragon Punch.
  class Srk
    def initialize
      puts "F,D,DF + P = SHORYUKEN!!!!!!"
    end
  end
end

#Here we refernece the module we want, and use teh '::' operator to access the objects inside it.
#In this case we want to create the object that represents "www.shoryuken.com"
FightingGameWebsite::Srk.new

#In this case we want to execute Ryu's Shoryuken move.
Ryu::Srk.new

#Here we are grabbing the version constant from teh Ryu module. 
puts Ryu::VERSION
