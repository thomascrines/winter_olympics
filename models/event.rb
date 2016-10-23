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
    sql = "INSERT INTO events (name, gender, discipline_id) VALUES ('#{@name}', '#{@gender}', #{@discipline_id}) RETURNING *"
    event_data = SqlRunner.run(sql)
    @id = event_data.first['id'].to_i
  end

  def gold_winner()
    
  end

  def silver_winner()

  end

  def bronze_winner()
    
  end

  def self.all
    query = query.to_s
    sql = "SELECT * FROM events"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    events_data = SqlRunner.run(sql)
    return events_data.map {|event_data| Event.new(event_data)}
  end

  def self.find()
    
  end

  def self.update()
    
  end

  def self.destroy()

  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

end