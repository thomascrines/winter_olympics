require 'pg'
require_relative '../db/sql_runner'
require_relative '../models/event'

class Discipline

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO disciplines (name) VALUES ('#{@name}') RETURNING *"
    discipline_data = SqlRunner.run(sql)
    @id = discipline_data.first['id'].to_i
  end
  
end