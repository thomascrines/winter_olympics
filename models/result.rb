require 'pg'
require_relative '../db/sql_runner'
require_relative '../models/event'
require_relative '../models/album'

class Result

  attr_reader :id, :name, :event_id, :gold_id, :silver_id, :bronze_id 

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @event_id = options['event_id']
    @gold_id = options['gold_id']
    @silver_id = options['silver_id']
    @bronze_id = options['bronze_id']
  end

  def save()
    sql = "INSERT INTO events (name, event_id, gold_id, silver_id, bronze_id) VALUES ('#{@name}', #{@event_id}, #{@gold_id}, #{@silver_id}, #{@bronze_id}) RETURNING *"
    result_data = SqlRunner.run(sql)
    @id = result_data.first['id'].to_i
  end

end