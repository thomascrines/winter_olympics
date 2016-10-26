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

  def golds()
    sql = "SELECT results.* FROM results INNER JOIN athletes ON athletes.id = results.gold_id WHERE team_id = #{@id}"
    return Team.map_items(sql).count
  end

  def silvers()
    sql = "SELECT results.* FROM results INNER JOIN athletes ON athletes.id = results.silver_id WHERE team_id = #{@id}"
    return Team.map_items(sql).count
  end

  def bronzes()
    sql = "SELECT results.* FROM results INNER JOIN athletes ON athletes.id = results.bronze_id WHERE team_id = #{@id}"
    return Team.map_items(sql).count
  end

  def points_total()
    sql_gold = "SELECT results.* FROM results INNER JOIN athletes ON athletes.id = results.gold_id WHERE team_id = #{@id}"
    golds = Team.map_items(sql_gold).count

    sql_silver = "SELECT r.* FROM results r INNER JOIN athletes a ON a.id = r.silver_id WHERE team_id = #{@id}"
    silvers = Team.map_items(sql_silver).count

    sql_bronze = "SELECT r.* FROM results r INNER JOIN athletes a ON a.id = r.bronze_id WHERE team_id = #{@id}"
    bronzes = Team.map_items(sql_bronze).count

    return (golds * 5) + (silvers * 3) + (bronzes)
  end

  def athletes()
    sql = "SELECT * FROM athletes WHERE team_id = #{id}"
    athletes_data = SqlRunner.run(sql)
    return athletes_data.map {|athlete_data| Athlete.new(athletes_data)}
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM teams"
    sql = sql + " WHERE name LIKE '<%#{query}%>'" unless query.empty?
    teams_data = SqlRunner.run(sql)
    return teams_data.map {|team_data| Team.new(team_data)}
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = #{id}"
    found_team = SqlRunner.run(sql)
    return Team.new(found_team.first)
  end

  def self.update(options)
    sql = "UPDATE teams SET (name, code, flag_url) = ('#{options['name']}', '#{options['code']}', '#{options['flag_url']}') WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM teams WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    medals = SqlRunner.run(sql)
    result = medals.map {|medal| Team.new(medal)}
    return result
  end

end