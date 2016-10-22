require 'pry-byebug'
require_relative '../models/team'
require_relative '../models/athlete'
require_relative '../models/discipline'
require_relative '../models/event'
require_relative '../models/result'

Result.delete_all()
Discipline.delete_all()
Event.delete_all()
Team.delete_all()
Athlete.delete_all()

team001 = Team.new({'name' => "", 'code' => "", 'flag_url' => ""})
team001.save()
team002 = Team.new({'name' => "", 'code' => "", 'flag_url' => ""})
team002.save()

athlete001 = Athlete.new({'name' => "", 'gender' => "", 'team_id' => teamX.id})
athlete001.save()
athlete002 = Athlete.new({'name' => "", 'gender' => "", 'team_id' => teamX.id})
athlete002.save()

discipline1 = Discipline.new({'name' => ""})
discipline1.save()
discipline2 = Discipline.new({'name' => ""})
discipline2.save()
discipline3 = Discipline.new({'name' => ""})
discipline3.save()

event001 = Event.new({'name' => "", 'gender' => "", 'discipline_id' => disciplineX.id})
event001.save()
event002 = Event.new({'name' => "", 'gender' => "", 'discipline_id' => disciplineX.id})
event002.save()
event003 = Event.new({'name' => "", 'gender' => "", 'discipline_id' => disciplineX.id})
event003.save()
event004 = Event.new({'name' => "", 'gender' => "", 'discipline_id' => disciplineX.id})
event004.save()

result001 = Result.new({'event_id' => eventX.id, 'gold_id' => athleteX.id, 'silver_id' => athletex.id, 'bronze_id' => athleteX.id})
result001.save


