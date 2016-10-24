require 'pg'
require 'pry-byebug'
require_relative '../db/runner'

class Athlete

  attr_reader :id, :name, :gender, :team_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @team_id = options['team_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name, gender, team_id) VALUES ('#{@name}', '#{@gender}', #{@team_id}) RETURNING *"
    athlete_data = SqlRunner.run(sql)
    @id = athlete_data.first['id'].to_i
  end

  def team()
    sql = "SELECT * FROM teams WHERE id = #{@team_id}"
    team = SqlRunner.run(sql)
    return Team.new(team.first)
  end

  def golds()
    sql = "SELECT * FROM results WHERE gold_id = #{@id}"
    golds = SqlRunner.run(sql)
    return golds.count
  end

  def silvers()
    sql = "SELECT * FROM results WHERE silver_id = #{@id}"
    silvers = SqlRunner.run(sql)
    return silvers.count
  end

  def bronzes()
    sql = "SELECT * FROM results WHERE bronze_id = #{@id}"
    bronzes = SqlRunner.run(sql)
    return bronzes.count
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM athletes"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    athletes_data = SqlRunner.run(sql)
    return athletes_data.map {|athlete_data| Athlete.new(athlete_data)}
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    found_athlete = SqlRunner.run(sql)
    return Athlete.new(found_athlete.first)
  end

  def self.update(options)
    sql = "UPDATE athletes SET (name, gender, team_id) = ('#{options['name']}, '#{options[':gender']}', #{options[':team_id']}) WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM athletes WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

end