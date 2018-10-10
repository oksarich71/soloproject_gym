require_relative( '../db/sql_runner' )

class Timetable

  attr_reader(:id, :gymclass_id)
  attr_accessor(:time, :day, :capacity)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @gymclass_id = options['gymclass_id'].to_i
    @time = options['time']
    @day = options['day']
    @capacity = options['capacity']
  end

def  save()
  sql = 'INSERT INTO timetable (gymclass_id, time, day, capacity) VALUES ($1, $2, $3, $4) RETURNING id'
  values = [@gymclass_id, @time, @day, @capacity]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def self.find(id)
  sql = "SELECT * from timetable
          where id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Timetable.new(results.first)
end





 def self.delete_all()
   sql = "DELETE FROM timetable"
   SqlRunner.run(sql)
  end

def self.all()
  sql = "SELECT * FROM timetable"
  result = SqlRunner.run(sql)
  return result.map {|timetable| Timetable.new (timetable)}
end

def update()
  sql = "UPDATE timetable
         SET (gymclass_id, time, day, capacity) = ($1,$2,$3,$4)
         WHERE id = $5"
  values = [@gymclass_id, @time, @day, @capacity, @id]
  SqlRunner.run(sql, values)
end

def gymclass()
  sql = "SELECT * FROM gymclasses
  WHERE id = $1"
  values = [@gymclass_id]
  results = SqlRunner.run(sql, values)
  gymclasses = results.map {|gymclass| Gymclass.new(gymclass)}
  return gymclasses.first
end


def list_members()
  sql = "select Members.* from bookings
        inner join members
        on member_id = members.id
        inner join timetable
        on timetable_id = timetable.id
        where timetable_id = $1;"
        values = [@id]
        members_data = SqlRunner.run(sql, values)
        result = members_data.map { |member| Member.new( member ) }
        return result
  end

  #
end #class end
