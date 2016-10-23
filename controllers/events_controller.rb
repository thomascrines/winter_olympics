#INDEX
get '/events' do
  user_input = params[:search]
  @events = Event.all(user_input)
  erb :'events/index'
end

#CREATE
get '/events/new' do
  erb :'events/new'
end

#NEW
post '/events' do
  @event = Event.new(params)
  @event.save()
  redirect to '/events'
end

#SHOW
get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'events/show'
end

#EDIT
get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :'events/edit'
end

#UPDATE
put '/events/:id' do
  @event = Event.update(params)
  redirect to '/events/#{params[:id]}'
end

#DELETE
delete '/events/:id' do
  Event.destroy(params[:id])
  redirect to '/events'
end