#This will show name of the top level object in Ruby. (Main)
puts "Global Self = #{self.inspect}"

class Foo
  #This will how the name of the actual class.
  puts "Inside class Foo = #{self.inspect}"
  
  def bar
      #This will display the notation for an instance of a class.
      puts "Inside method bar which is an instance of class Foo = #{self.inspect}"
  end
end

f = Foo.new
f.bar