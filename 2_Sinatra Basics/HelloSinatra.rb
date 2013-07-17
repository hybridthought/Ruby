require "rubygems"

#Sinatra is a RubyGem that includes a simple webserver to execute ruby scripts and transform them into viewable content on the browser.
require "sinatra"

#Get in this case is a Sinatra method for purforming HTTP Get.
#The first paramater "/" indicates the path expected to trigger the code.
#In this case the code to trigger is a code block.

#Root URL
get "/" do
    "Hello World"
end

#About URL
get "/about" do
  
    #ERB allows us to pass dynamic content to our ERB view code.
    #To do so, we need to prefix our variable with an '@' symbol.
    # In ruby the '@' symbol indicates that the variable is a property of an object.
    @number_of_employees = 200
    
    #Sinatra offers an ERB method that reads in and erb file. 
    #Since this is the last executed line in the code block this is what will get returned to the browser.
    #A symbol is passed in with the name ":about". A "Symbol" is a very light wait reference. (No memory allocaiton like a string.)
    #In this case the erb method requires a symbol that equals the name of the erb file found in our view folder. This is how it knows where to read from.
    erb :about 
end

#Contact URL
get "/contact" do
    erb :contact
end

#Games URL
get "/gaming" do
    erb :gaming
end
