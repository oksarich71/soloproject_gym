require_relative( '../db/sql_runner' )

class Gymclass

  attr_reader(:id)
  attr_accessor(:type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
      sql = "INSERT INTO gymclasses
      (
        type
      )
      VALUES
      (
        $1
      )
      RETURNING id"
      values = [@type]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM gymclasses"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM gymclasses"
      result = SqlRunner.run (sql)
      return result.map { |gymclass| Gymclass.new (gymclass)}
    end

    def update()
        sql = "UPDATE gymclasses
        SET type = $1
        WHERE id = $2"
      values = [@type, @id]
      SqlRunner.run(sql, values)
    end

    def self.delete(id)
      sql = "DELETE FROM gymclasses
             WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end


end #class end
