require "rubygems"
require "sinatra"



#Helper Method We Created to provide convenience methods to our erb views.
helpers do
  #The "include" statement is allowing us to include a library on the fly.
  #In this case we are importing the object Utils from the Rack library.
  include Rack::Utils
  
  #The "alias_method" method, allows us to refer to call a method with a custom name.
  #In this case when any code calls the method "h" we are really calling the "escape_html" from the Rack Util class.
  #See echo_form.erb for example.
  alias_method :h, :escape_html
end

# Method we create to simulate finding content post by id.
def find_post(postId)
  if postId == "sf4"
    "Street Fighter 4"
  elsif postId == "mk9"
    "Mortal Kombat 9"
  end
end

# GENERAL
#The following mehtods are defining ROUTES.
#These routes our URLS that a user could type into the browser.
#When a URL typed in matches a defined URL and invokation method (Get/Put) the method takes control and executes.
#NOTE: These methods get evaluated in sequence so ORDER MATTERS.
#If you happened to define to ROUTES that some how match the same URL Sintra will execute the first matching method.

#The following is an example of the Sinatra redirect method, to force the browser to redirect to a differnt location.
get "/" do
  #Here we are redirecting to /blog/post/sf4
  redirect "/blog/post/sf4"
  
=begin
  Other usages of redirect are...
  
  #Here you can see we are doign a slightly more imformative redirect.
  #We are telling the browser to redirect to the URL, and set the HTTP response header to a code (in this case 403 which means forbidden) along with some text to render on the browser.
  redirect "/blog/post/sf4", 403, "You are Forbidden"
=end
  
end

# When Sinatra can not find matching route this method is triggered.
# In this example we are rendering our own not found page.
# NOTE: If you call redirect (see above), with a 404 not found code this method automatically gets triggered.
not_found do
  erb :not_found
end

#For typical Browser Requests
get "/echo" do
  @default_string = params[:string]
  erb :echo_form
end


#For typical Form Requests.
#Notice some of the Ruby Conventions that make the code much leaner than you are use to.
# See a commented out traditional version below for comparision.
post "/echo" do 

  #Params is the object in Sinatra that allows you to read form values form a view.
  #Params is an array of all form values on a page.  By passing in the "symbol" or name of the field element (matching html attribute "name") you acccess the value on the form.
  string = params[:string]
  
  # Some Ruby objects have an optional bang version of methods that instantly changes the value of the variable (not perserving value).
  # NOTE: Not all Ruby methods support a bang method....need to see documentation for clarification.
  string.upcase! if params[:upcase]
  string.reverse! if params[:reverse]
  
  # Remember, the last line executed in a method is what gets returned.
  string
end


#The commented out block of code is valid....it is familiar to the java code style you already know.
#You can compare this to method above to see the style contrast.
=begin
  post "/echo" do
    string = params[:string]
    if params[:upcase]
      string = string.upcase
    end
  
    if params[:reverse]
      string = string.reverse
    end
 
    string
  end
=end


#Sample get request, that actually creates a ":id" variable in the path.
#This is Sinatra explicit. This essentially takes the value after "/blog/post/" and captures it in the id symbol, and injects it into the params object.
#This is used to create simpler URL with out the need of URL params.
get "/blog/post/:id" do
  @post_id = params[:id]
  @post = find_post @post_id
  
  # 'pass' is a Sinatra method that indicates to break out of this method, and find another matching route.
  # This method should have a condition to break if a condition is met.  In this case "unless" is being used.
  # "unless" is like an "if" but the opposite.  It semanticaly saying..... unless is like if false
  pass unless @post
  erb :blog_post
end


#Sample of dynamic URLS
#Sinatra supports the SPLAT or '*' operator to match a URL.  It's like a regular expression.
#The piece that matches the '*' will be stored in the :splat index of the params array.  
get "/blog/post/*" do
  #First thing you will notice on the console is that the object in the :splat is an array.
  #This is because you can have multiple splats in the URL and capture each piece individually. SEE METHOD BELOW.
  "Could not find the blog post you were looking for. Sorry :("
end


#Sample with multiple SPLAT usage.
#In this case each matching piece will be stored in an index in the array.
get "/*/multi_splat_test/*" do
  params[:splat].inspect  #inspect is a ruby method on objects that let you get a human readable version of it. (Like toString in Java)
end


