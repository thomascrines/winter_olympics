require 'pg'
require_relative '../db/runner'
require_relative '../models/athlete'

class Team

  attr_reader :id, :name, :code, :flag_url

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @code = options['code']
    @flag_url = options['flag_url']
  end

  def save()
    sql = "INSERT INTO teams (name, code, flag_url) VALUES ('#{@name}', '#{@code}', '#{@flag_url}') RETURNING *"
    team_data = SqlRunner.run(sql)
    @id = team_data.first['id'].to_i
  end

  def athletes()
    sql = "SELECT * FROM athletes WHERE team_id = #{id}"
    athletes_data = SqlRunner.run(sql)
    return athletes_data.map {|athlete_data| Athlete.new(athletes_data)}
  end

  def golds()
    
  end

  def silvers()

  end

  def bronzes()

  end

  def points_total()
    
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM teams"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    teams = SqlRunner.run(sql)
    return teams.map {|team| Team.new(team)}
  end

  def self.find()
    sql = "SELECT * FROM teams WHERE id = #{id}"
    found_team = SqlRunner.run(sql)
    return Team.new(found_team.first)
  end

  def self.update(options)
    sql = "UPDATE teams SET (name, code, flag_url) = ('#{options['name']}, '#{options['code']}', '#{options['flag_url']}'}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM teams WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

end