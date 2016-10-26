#INDEX
get '/events' do
  user_input = params[:search]
  @events = Event.all(user_input)
  erb :'events/index'
end

#NEW
get '/events/new' do
  @event = Event.new(params)
  @disciplines = Discipline.all()
  erb :'events/new'
end

#CREATE
post '/events' do
  @disciplines = Discipline.all()
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
  @disciplines = Discipline.all()
  @event.save()
  erb :'events/edit'
end

#UPDATE
put '/events/:id' do
  @event = Event.update(params)
  @gender = @event.gender
  @disciplines = Discipline.all
  @event.save
  redirect to '/events'
end

#DELETE
delete '/events/:id' do
  Event.destroy(params[:id])
  redirect to '/events'
end