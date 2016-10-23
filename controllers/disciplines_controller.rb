#INDEX
get '/disciplines' do
  user_input = params[:search]
  @disciplines = Discipline.all(user_input)
  erb :'disciplines/index'
end

#CREATE
get '/disciplines/new' do
  erb :'disciplines/new'
end

#NEW
post '/disciplines' do
  @discipline = Discipline.new(params)
  @discipline.save()
  redirect to '/disciplines'
end

#SHOW
get '/disciplines/:id' do
  @discipline = Discipline.find(params[:id])
  erb :'disciplines/show'
end

#EDIT
get '/disciplines/:id/edit' do
  @discipline = Discipline.find(params[:id])
  erb :'disciplines/edit'
end

#UPDATE
put '/disciplines/:id' do
  @discipline = Discipline.update(params)
  redirect to '/disciplines/#{params[:id]}'
end

#DELETE
delete '/disciplines/:id' do
  Discipline.destroy(params[:id])
  redirect to '/disciplines'
end