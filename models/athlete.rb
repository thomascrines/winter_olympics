require 'pg'
require 'pry-byebug'
require_relative '../db/runner'

class Athlete

  attr_reader :id, :name, :gender, :team_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @team_id = options['team_id']
  end

  def save()
    sql = "INSERT INTO athletes (name, gender, team_id) VALUES ('#{@name}', '#{@gender}', #{@team_id}) RETURNING *"
    athlete_data = SqlRunner.run(sql)
    @id = athlete_data.first['id'].to_i
  end

end