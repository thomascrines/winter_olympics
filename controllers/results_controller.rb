#INDEX
get '/results' do
  user_input = params[:search]
  @results = result.all(user_input)
  erb :'results/index'
end

#CREATE
get '/results/new' do
  erb :'results/new'
end

#NEW
post '/results' do
  @result = result.new(params)
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
  @result = result.find(params[:id])
  @results = result.all()
  erb :'results/edit'
end

#UPDATE
put '/results/:id' do
  @result = result.update(params)
  redirect to '/results/#{params[:id]}'
end

#DELETE
delete '/results/:id' do
  result.destroy(params[:id])
  redirect to '/results'
end