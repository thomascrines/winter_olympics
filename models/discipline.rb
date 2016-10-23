require 'pg'
require_relative '../db/runner'
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

  def events()
    sql = "SELECT * FROM events WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM disciplines"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    disciplines_data = SqlRunner.run(sql)
    return disciplines_data.map {|discipline_data| Discipline.new(discipline_data)}
  end

  def self.find(id)
    sql = "SELECT * FROM disciplines WHERE id = #{id}"
    found_discipline = SqlRunner.run(sql)
    return Discipline.new(found_discipline.first)
  end

  def self.update()
    
  end

  def self.destroy()

  end

  def self.delete_all()
    sql = "DELETE FROM disciplines"
    SqlRunner.run(sql)
  end
  
end