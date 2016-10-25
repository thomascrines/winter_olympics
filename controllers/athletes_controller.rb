#INDEX
get '/athletes' do
  user_input = params[:search]
  @athletes = Athlete.all(user_input)
  erb :'athletes/index'
end

#CREATE
get '/athletes/new' do
  @teams = Team.all()
  erb :'athletes/new'
end

#NEW
post '/athletes' do
  @teams = Team.all
  @athlete = Athlete.new(params)
  @athlete.save()
  redirect to '/athletes'
end

#SHOW
get '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  erb :'athletes/show'
end

#EDIT
get '/athletes/:id/edit' do
  @athlete = Athlete.find(params[:id])
  @teams = Team.all()
  erb :'athletes/edit'
end

#UPDATE
put '/athletes/:id' do
  @athlete = Athlete.update(params)
  @teams = Team.all()
  @athlete.save
  redirect to '/athletes/#{params[:id]}'
end

#DELETE
delete '/athletes/:id' do
  Athlete.destroy(params[:id])
  redirect to '/athletes'
end
  