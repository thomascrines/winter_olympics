require 'pg'
require_relative '../db/runner'
require_relative '../models/event'
require_relative '../models/athlete'

class Result

  attr_reader :id, :event_id, :gold_id, :silver_id, :bronze_id 

  def initialize(options)
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @gold_id = options['gold_id'].to_i
    @silver_id = options['silver_id'].to_i
    @bronze_id = options['bronze_id'].to_i
  end

  def save()
    sql = "INSERT INTO results (event_id, gold_id, silver_id, bronze_id) VALUES (#{@event_id}, #{@gold_id}, #{@silver_id}, #{@bronze_id}) RETURNING *"
    result_data = SqlRunner.run(sql)
    @id = result_data.first['id'].to_i
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM results"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    results_data = SqlRunner.run(sql)
    return results_data.map {|result_data| Result.new(result_data)}
  end

  def self.find(id)
    sql = "SELECT * FROM results WHERE id = #{id}"
    found_result = SqlRunner.run(sql)
    return Result.new(found_result.first)
  end

  def self.update(options)
    sql = "UPDATE athletes SET (name, gender, team_id) = ('#{options['name']}, '#{options[':gender']}', #{options[':team_id']}) WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM results WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM results"
    SqlRunner.run(sql)
  end

end