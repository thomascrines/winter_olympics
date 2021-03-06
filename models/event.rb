require 'pg'
require_relative '../db/runner'
require_relative 'discipline'
require 'pry-byebug'

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
    sql = "SELECT athletes.* FROM athletes INNER JOIN results ON results.gold_id = athletes.id WHERE event_id = #{@id}"
    athlete = SqlRunner.run(sql).first
    return if athlete == nil
    return Athlete.new(athlete)
  end

  def silver_winner()
    sql = "SELECT athletes.* FROM athletes INNER JOIN results ON results.silver_id = athletes.id WHERE event_id = #{@id}"
    athlete = SqlRunner.run(sql).first
    return if athlete == nil
    return Athlete.new(athlete)
  end

  def bronze_winner()
    sql = "SELECT athletes.* FROM athletes INNER JOIN results ON results.bronze_id = athletes.id WHERE event_id = #{@id}"
    athlete = SqlRunner.run(sql).first
    return if athlete == nil
    return Athlete.new(athlete)
  end

  def result()
    sql = "SELECT * FROM results WHERE event_id = #{id}"
    result = SqlRunner.run(sql).first
    return if result == nil
    return Result.new(result)
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM events"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    events_data = SqlRunner.run(sql)
    return events_data.map {|event_data| Event.new(event_data)}
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    found_event = SqlRunner.run(sql)
    return Event.new(found_event.first)
  end

  # doesn't update, adds a new...

  def self.update(options)
    sql = "UPDATE events SET name = '#{options['name']}', gender = '#{options['gender']}', discipline_id = #{options['discipline_id']} WHERE id = #{options['id'].to_i} RETURNING *"
    result = SqlRunner.run(sql).first
    return Event.new(result)
  end

  def self.destroy(id)
    sql = "DELETE FROM events WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

  # def self.map_item(sql)
  #   events = SqlRunner.run(sql)
  #   result = events.map {|event| Event.new(event)}
  #   return result.first
  # end

end