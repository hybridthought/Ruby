class Storage
  def initialize data
    @data = data
  end

  #In Ruby when a method is called on an object that doesn't exist, ruby automatically calls a method_missing function.
  #By creating a definition for this metod, we can override the behavior.
  # PARAM1 - sym = This is a :symbol with the name of the method that was called
  # PARAM2 - *args = This is an array of all arguments passed on the method call.
  # PARAM3 - &block = This is a block of ruby code if specified
  def method_missing sym, *args, &block
    
    #Since the object @data is a hashset we can verify if the key is present usign the key? method.
    #In this case we are taking the symbol and converting it into a true string, and returnign the map associated.
    if @data.key? sym.to_s
      
      #NOTE: Return leaves the method immediately
      return @data[sym.to_s]
    end
    
    #If we dont find teh value in our hash, lets call the defaul method_missing method by calling super and passing theß args.
    super sym, *args, &block
  end
  
  #Ruby objects have a response_to? method that works in conjunction with method missing.
  #This method return true or false, depending if the object can execute a particular method call.
  def respond_to? sym
    return true if @data.key? sym.to_s
    
    #If the method is not supported we performt the default respond_to? behavior.
    super sym
  end
  
end

#Below you will see the representation of a hashmasp.
store = Storage.new({'one' => 1, 'two' => 2, 'foo' => 'bar'})


#The following methods are safeguarded by checking if the method exits on the object prior to making the call.
if store.respond_to? :one
  puts store.one
end

if store.respond_to? :two
  puts store.two
end

if store.respond_to? :foo
  puts store.foo
end