require_relative('../db/sql_runner')

class Customer

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  # def self.all()
  #   sql = "SELECT * FROM users"
  #   return self.get_many(sql)
  # end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

end