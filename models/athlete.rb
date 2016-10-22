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

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

end