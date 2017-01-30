require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/athlete'
require_relative './models/discipline'
require_relative './models/event'
require_relative './models/result'
require_relative './models/team'
require_relative './controllers/athletes_controller'
require_relative './controllers/disciplines_controller'
require_relative './controllers/events_controller'
require_relative './controllers/results_controller'
require_relative './controllers/teams_controller'

get '/' do
  erb(:home)
end