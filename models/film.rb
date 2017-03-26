require_relative('../db/sql_runner')

class Film

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def customers()
    sql = "SELECT customers.* from customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = #{@id}"
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def bookings()
    sql = "SELECT customers.* from customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = #{@id}"
    customers = SqlRunner.run(sql)
    return customers.count
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films where id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id}"
    results = SqlRunner.run(sql)
    film_hash = results.first
    film = Film.new(film_hash)
    return film
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end