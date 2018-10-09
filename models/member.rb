require_relative( '../db/sql_runner' )

class Member

  attr_reader(:id)
  attr_accessor(:name, :membership)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @membership = options['membership']
  end

  def save()
      sql = "INSERT INTO members
      (
        name,
        membership
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @membership]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM members"
    SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM members"
      result = SqlRunner.run(sql)
      return result.map { |member| Member.new (member)}
    end

    def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first)
  end

  def update()
    sql = "UPDATE members
    SET (name, membership) = ($1,$2)
    WHERE id = $3"
    values = [@name, @membership, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end #class end
