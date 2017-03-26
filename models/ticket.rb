require_relative("../db/sql_runner")
require_relative("customer")
require_relative("film")

class Ticket

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') RETURNING id"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets where id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end