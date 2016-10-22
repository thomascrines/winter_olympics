require 'pg'
require_relative '../db/runner'
require_relative '../models/athlete'

class Team

  attr_reader :id, :name, :code, :flag_url

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @code = options['code']
    @flag_url = options['flag_url']
  end

  def save()
    sql = "INSERT INTO teams (name, code, flag_url) VALUES ('#{@name}', '#{@code}', '#{@flag_url}') RETURNING *"
    team_data = SqlRunner.run(sql)
    @id = team_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

end