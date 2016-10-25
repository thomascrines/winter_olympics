#INDEX
get '/results' do
  user_input = params[:search]
  @results = Result.all(user_input)
  erb :'results/index'
end
#NEW

get '/results/:id/new' do
  @athletes = Athlete.all()
  @event = Event.find(params[:id])
  erb :'results/new'
end

#CREATE
put '/results' do
  @result = Result.new(params)
  @result.save()
  redirect to '/events'
end

#SHOW
get '/results/:id' do
  @result = Result.find(params[:id])
  redirect to '/events'
end

#EDIT
get '/results/:id/edit' do
  @athletes = Athlete.all()
  @event = Event.new(params)
  @results = Result.all()
  @result = Result.find(params[:id])
  erb :'results/edit'
end

#UPDATE
put '/results/:id' do
  @result = Result.update(params)
  redirect to '/events'
end

#DELETE
delete '/results/:id' do
  Result.destroy(params[:id])
  redirect to '/results'
end