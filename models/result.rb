require 'pg'
require_relative '../db/runner'
require_relative '../models/event'
require_relative '../models/athlete'

class Result

  attr_reader :id, :event_id, :gold_id, :silver_id, :bronze_id 

  def initialize(options)
    @id = options['id'].to_i
    @event_id = options['event_id']
    @gold_id = options['gold_id']
    @silver_id = options['silver_id']
    @bronze_id = options['bronze_id']
  end

  def save()
    sql = "INSERT INTO events (event_id, gold_id, silver_id, bronze_id) VALUES ('#{@name}', #{@event_id}, #{@gold_id}, #{@silver_id}, #{@bronze_id}) RETURNING *"
    result_data = SqlRunner.run(sql)
    @id = result_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM results"
    SqlRunner.run(sql)
  end

end