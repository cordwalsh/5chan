require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')
require('./lib/board')


get ('/')do
  @board = Message.all
  erb :default
end

get ('/home')do
  @board = Message.all
  erb :default
end

get ('/new_message')do
  @board = Message.all
  erb :new_message
end

post ('/')do
  message = Message.new({:author => params[:user_name], :content => params[:user_message]})
  Message.add(message)
  @board = Message.all
  redirect to('/')
end

get ('/post/:id')do
  @post = Message.search(params[:id].to_i)
  erb :post
end

get ('/post/:id/edit')do
  @post = Message.search(params[:id].to_i)
  erb :edit_post
end

post ('/update/:id')do
    Message.edit(params[:id].to_i,params[:new_content])
  redirect to ('/')
end
