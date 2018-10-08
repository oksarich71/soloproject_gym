require_relative( '../db/sql_runner' )

class Booking

  attr_reader(:id)
  attr_accessor(:member_id, :timetable_id)


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @timetable_id = options['timetable_id'].to_i
  end

def save()
  sql = 'INSERT INTO bookings
    (member_id, timetable_id)
    VALUES ($1, $2) RETURNING id'
    values = [@member_id, @timetable_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM bookings"
  SqlRunner.run(sql)
  end

def self.all()
  sql = "SELECT * FROM bookings"
  result = SqlRunner.run(sql)
  return result.map { |booking| Booking.new(booking) }
end

def update()
  sql = "UPDATE bookings
  SET (member_id, timetable_id) = ($1,$2)
  WHERE id = $3"
  values = [@member_id, @timetable_id, @id]
  SqlRunner.run(sql, values)
end


end #class end
