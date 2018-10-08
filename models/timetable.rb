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


end #class end
