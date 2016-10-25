#INDEX
get '/teams' do
  user_input = params[:search]
  @teams = Team.all(user_input)
  erb :'teams/index'
end

#CREATE
get '/teams/new' do
  erb :'teams/new'
end

#NEW
post '/teams' do
  @team = Team.new(params)
  @team.save
  redirect to '/teams'
end

#SHOW
get '/teams/:id' do
  @team = Team.find(params[:id])
  erb :'teams/show'
end

#EDIT
get '/teams/:id/edit' do
  @team = Team.find(params[:id])
  erb :'team/edit'
end

#UPDATE
put '/teams/:id' do
  @team = Team.update(params)
  redirect to '/artists/#{params[:id]}'
end

#DELETE
delete '/teams/:id' do
  Team.destroy(params[:id])
  redirect to '/teams'
end