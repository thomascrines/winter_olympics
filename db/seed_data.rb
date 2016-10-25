require 'pry-byebug'
require_relative '../models/team'
require_relative '../models/athlete'
require_relative '../models/discipline'
require_relative '../models/event'
require_relative '../models/result'

Team.delete_all()
Athlete.delete_all()
Discipline.delete_all()
Event.delete_all()
Result.delete_all()

team01 = Team.new({'name' => "Canada", 'code' => "CAN", 'flag_url' => "flags/Canada.png"})
team01.save()
team02 = Team.new({'name' => "Czech Republic", 'code' => "CZE", 'flag_url' => "flags/Czech Republic.png"})
team02.save()
team03 = Team.new({'name' => "Finland", 'code' => "FIN", 'flag_url' => "flags/Finland.png"})
team03.save()
team04 = Team.new({'name' => "Germany", 'code' => "GER", 'flag_url' => "flags/Germany.png"})
team04.save()
team05 = Team.new({'name' => "Norway", 'code' => "NOR", 'flag_url' => "flags/Norway.png"})
team05.save()
team06 = Team.new({'name' => "Russia", 'code' => "RUS", 'flag_url' => "flags/Russia.png"})
team06.save()
team07 = Team.new({'name' => "Slovenia", 'code' => "SLO", 'flag_url' => "flags/Slovenia.png"})
team07.save()
team08 = Team.new({'name' => "Slovakia", 'code' => "SVK", 'flag_url' => "flags/Slovakia.png"})
team08.save()
team09 = Team.new({'name' => "South Korea", 'code' => "KOR", 'flag_url' => "flags/South Korea.png"})
team09.save()
team10 = Team.new({'name' => "Sweden", 'code' => "SLO", 'flag_url' => "flags/Sweden.png"})
team10.save()
team11 = Team.new({'name' => "United States", 'code' => "USA", 'flag_url' => "flags/United States.png"})
team11.save()
team12 = Team.new({'name' => "Switzerland", 'code' => "SUI", 'flag_url' => "flags/Switzerland.png"})
team12.save()

athlete001 = Athlete.new({'name' => "Lindsey Vonn", 'gender' => "Women", 'team_id' => team11.id})
athlete001.save()
athlete002 = Athlete.new({'name' => "Shaun White", 'gender' => "Men", 'team_id' => team11.id})
athlete002.save()
athlete003 = Athlete.new({'name' => "Yu-na Kim", 'gender' => "Women", 'team_id' => team09.id})
athlete003.save()
athlete004 = Athlete.new({'name' => "Sidney Crosby", 'gender' => "Men", 'team_id' => team01.id})
athlete004.save()
athlete005 = Athlete.new({'name' => "Carlo Janka", 'gender' => "Men", 'team_id' => team12.id})
athlete005.save()
athlete006 = Athlete.new({'name' => "Somin Ammann", 'gender' => "Men", 'team_id' => team12.id})
athlete006.save()
athlete007 = Athlete.new({'name' => "Hannah Teter", 'gender' => "Women", 'team_id' => team10.id})
athlete007.save()
athlete008 = Athlete.new({'name' => "Angela Rugerrio", 'gender' => "Women", 'team_id' => team02.id})
athlete008.save()
athlete009 = Athlete.new({'name' => "Evgeni Plushenko", 'gender' => "Men", 'team_id' => team06.id})
athlete009.save()
athlete010 = Athlete.new({'name' => "Pietro Piller Cottrer", 'gender' => "Men", 'team_id' => team03.id})
athlete010.save()
athlete011 = Athlete.new({'name' => "Ole Einar Bjorndalen", 'gender' => "Men", 'team_id' => team05.id})
athlete011.save()
athlete012 = Athlete.new({'name' => "Marit Bjorgen", 'gender' => "Women", 'team_id' => team05.id})
athlete012.save()
athlete013 = Athlete.new({'name' => "Claudia Pechstein", 'gender' => "Women", 'team_id' => team04.id})
athlete013.save()
athlete014 = Athlete.new({'name' => "Sixten Jernberg", 'gender' => "Men", 'team_id' => team10.id})
athlete014.save()
athlete015 = Athlete.new({'name' => "Uschi Disl", 'gender' => "Women", 'team_id' => team04.id})
athlete015.save()
athlete016 = Athlete.new({'name' => "Viktor Ahn", 'gender' => "Men", 'team_id' => team09.id})
athlete016.save()
athlete017 = Athlete.new({'name' => "Ireen Wust", 'gender' => "Women", 'team_id' => team07.id})
athlete017.save()
athlete018 = Athlete.new({'name' => "Kjetil Andre Aamodt", 'gender' => "Men", 'team_id' => team06.id})
athlete018.save()
athlete019 = Athlete.new({'name' => "Gillis Grafstrom", 'gender' => "Men", 'team_id' => team10.id})
athlete019.save()
athlete020 = Athlete.new({'name' => "Armin Zoggeler", 'gender' => "Men", 'team_id' => team03.id})
athlete020.save()
athlete021 = Athlete.new({'name' => "Lyubov Yegorova", 'gender' => "Women", 'team_id' => team03.id})
athlete021.save()

discipline01 = Discipline.new({'name' => "Alpine Skiing"})
discipline01.save()
discipline02 = Discipline.new({'name' => "Biathlon"})
discipline02.save()
discipline03 = Discipline.new({'name' => "Bobsleigh"})
discipline03.save()
discipline04 = Discipline.new({'name' => "Cross Country Skiing"})
discipline04.save()
discipline05 = Discipline.new({'name' => "Curling"})
discipline05.save()
discipline06 = Discipline.new({'name' => "Figure Skating"})
discipline06.save()
discipline07 = Discipline.new({'name' => "Freestyle Skiing"})
discipline07.save()
discipline08 = Discipline.new({'name' => "Ice Hockey"})
discipline08.save()
discipline09 = Discipline.new({'name' => "Luge"})
discipline09.save()
discipline10 = Discipline.new({'name' => "Nordic Combined"})
discipline10.save()
discipline11 = Discipline.new({'name' => "Short Track"})
discipline11.save()
discipline12 = Discipline.new({'name' => "Skeleton"})
discipline12.save()
discipline13 = Discipline.new({'name' => "Ski Jumping"})
discipline13.save()
discipline14 = Discipline.new({'name' => "Snowboarding"})
discipline14.save()
discipline15 = Discipline.new({'name' => "Speed Skating"})
discipline15.save()

event001 = Event.new({'name' => "Men''s Downhill", 'gender' => "Men", 'discipline_id' => discipline01.id})
event001.save()
event002 = Event.new({'name' => "Women''s Downhill", 'gender' => "Women", 'discipline_id' => discipline01.id})
event002.save()
event003 = Event.new({'name' => "Men''s 10k", 'gender' => "Men", 'discipline_id' => discipline04.id})
event003.save()
event004 = Event.new({'name' => "Men''s 30k", 'gender' => "Men", 'discipline_id' => discipline04.id})
event004.save()
event005 = Event.new({'name' => "Women''s 10k", 'gender' => "Women", 'discipline_id' => discipline04.id})
event005.save()
event006 = Event.new({'name' => "Women''s 30k", 'gender' => "Women", 'discipline_id' => discipline04.id})
event006.save()

result001 = Result.new({'event_id' => event001.id, 'gold_id' => athlete002.id, 'silver_id' => athlete004.id, 'bronze_id' => athlete005.id})
result001.save
result002 = Result.new({'event_id' => event002.id, 'gold_id' => athlete001.id, 'silver_id' => athlete003.id, 'bronze_id' => athlete007.id})
result002.save
result003 = Result.new({'event_id' => event003.id, 'gold_id' => athlete009.id, 'silver_id' => athlete010.id, 'bronze_id' => athlete011.id})
result003.save
result004 = Result.new({'event_id' => event004.id, 'gold_id' => athlete021.id, 'silver_id' => athlete017.id, 'bronze_id' => athlete015.id})
result004.save


