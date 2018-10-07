require_relative( '../db/sql_runner' )

class Booking

  attr_reader(:id, :member_id, :timetable_id)


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
end #class end
