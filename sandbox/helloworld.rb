require "rubygems"
require "sinatra"

get "/" do
    "Hello World"
end

get "/helloworld" do
  erb :form
end

post "/helloworld" do
    @name = params[:name]
    erb :hello
end