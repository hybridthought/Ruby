#Basic Loop construct.
#This method takes in a code block and continues to execute till the the bode block calls break.
#In this case and infinite loop
=begin
loop do puts "Hello" end
=end

#Basic Loop With Break Condition
i=0
loop do
  i+=1
  print "#{i} "
  #Here we break out of the loop if the condition is true.
  break if i == 10
end

puts "\n"

#Basic Loop With Next Condition
#Next is like continue in Java.
i=0
loop do
  i+=1
  next if i == 5
  print "#{i} "
  #Here we break out of the loop if the condition is true.
  break if i == 10
end