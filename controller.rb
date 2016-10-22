require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/athlete'
require_relative './models/discipline'
require_relative './models/event'
require_relative './models/result'
require_relative './models/team'
require_relative './controllers/athletes_controller.rb'
require_relative './controllers/disciplines_controller.rb'
require_relative './controllers/events_controller.rb'
require_relative './controllers/results_controller.rb'
require_relative './controllers/teams_controller.rb