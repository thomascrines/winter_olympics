#INDEX
get '/results' do
  user_input = params[:search]
  @results = Result.all(user_input)
  erb :'results/index'
end

#CREATE
get '/results/new' do
  erb :'results/new'
end

#NEW
post '/results' do
  @result = Result.new(params)
  @result.save()
  redirect to '/results'
end

#SHOW
get '/results/:id' do
  @result = result.find(params[:id])
  erb :'results/show'
end

#EDIT
get '/results/:id/edit' do
  @result = Result.find(params[:id])
  @athletes = Athlete.all()
  @event = Event.new(params)
  @results = Result.all()
  erb :'results/edit'
end

#UPDATE
put '/results/:id' do
  @result = Result.update(params)
  redirect to '/results/#{params[:id]}'
end

#DELETE
delete '/results/:id' do
  Result.destroy(params[:id])
  redirect to '/results'
end