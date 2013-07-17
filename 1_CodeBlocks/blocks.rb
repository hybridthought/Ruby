#Sample method definition that takes 0 paramaters.
def say_hello
  puts "Hello"
end

say_hello

#Sample method definition that takes 1 paramater.
def say_hello_to(name)
  puts "Hello #{name}"
end

say_hello_to "Danny"

#Sample method definition that takes a code block.
def greet
  puts "Hello"
  
    #yield tells ruby to execute any passed in code blocks.
  #yield will always return the LAST interpreted line.
  puts yield
  puts "Goodbye"
end

#Sample Code Block being passed ot the greet method.  Blocks are always house by "do" "end"
greet do
  "Somethign from the code block"
end