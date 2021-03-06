require_relative('../db/sql_runner')

class Customer

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def films()
    sql = "SELECT films.* from films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = #{@id}"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def tickets()
    sql = "SELECT films.* from films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = #{@id}"
    tickets = SqlRunner.run(sql)
    return tickets.count
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers where id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = #{id}"
    results = SqlRunner.run(sql)
    customer_hash = results.first
    customer = Customer.new(customer_hash)
    return customer
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end