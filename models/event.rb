require 'pg'
require_relative '../db/runner'
require_relative 'discipline'

class Event

  attr_reader :id, :name, :gender, :discipline_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @discipline_id = options['discipline_id'].to_i
  end

  def save()
    sql = "INSERT INTO events (name, gender, discipline_id) VALUES ('#{@name}', #{@gender}, #{@discipline_id}) RETURNING *"
    event_data = SqlRunner.run(sql)
    @id = event_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

end