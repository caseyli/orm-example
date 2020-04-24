require 'pg'
require 'pry'

#########
#
#
# WARNING: This is for teaching purposes and is VULNERABLE TO SQL INJECTION!!!!
#
#
#########


class Product
	# Set These for your own
	HOST = 'localhost'
	PORT = 5434
	DB_NAME = 'ecommerce_app'
	USER = 'exampleuser'
	PASSWORD = 'examplepassword'

	def initialize(id, name, price, serial_no)
		@id = id
		@name = name
		@price = price
		@serial_no = serial_no
	end

	def set_id(id)
		@id = id
	end

	def get_id()
		return @id
	end

	def set_name(name)
		@name = name
	end

	def get_name()
		return @name
	end

	def set_price(price)
		@price = price
	end

	def get_price()
		return @price
	end

	def set_serial_no(serial_no)
		@serial_no = serial_no
	end

	def get_serial_no()
		return @serial_no
	end

	# ORM Methods
	def save
		# Connect to the database
		connection = PG::Connection.new({ host: Product::HOST,
								                      port: Product::PORT,
								                      dbname: Product::DB_NAME,
								                      user: Product::USER,
								                      password: Product::PASSWORD})

		# Create some kind of SQL statement
		command = "INSERT INTO products (id, name, price, serial_no) VALUES " + 
								"(" + 
								@id.to_s + ", " + 
								"'" + @name + "'" + ", " +
								@price.to_s + ", " +
								"'" + @serial_no + "'" +
								")"

		# Execute that SQL statement
		connection.exec(command)
	end

	def delete
		# Connect to the database
		connection = PG::Connection.new({ host: Product::HOST,
								                      port: Product::PORT,
								                      dbname: Product::DB_NAME,
								                      user: Product::USER,
								                      password: Product::PASSWORD})

		# Create some kind of command
		command = "DELETE FROM products WHERE id = " + @id.to_s

		# Execute that SQL Statement
		connection.exec(command)

	end

	def self.find(id)
		# Connect to the database
		connection = PG::Connection.new({ host: Product::HOST,
								                      port: Product::PORT,
								                      dbname: Product::DB_NAME,
								                      user: Product::USER,
								                      password: Product::PASSWORD})

		# Create some kind of SQL statement
		command = "SELECT * FROM products WHERE id = " + id.to_s

		# Execute the SQL Statement
		results = connection.exec(command)

		row = results[0]

		# Convert the results into a Product object
		product = Product.new(row["id"].to_i, 
													row["name"], 
													row["price"].to_f, 
													row["serial_no"])

		return product
	end

	def self.all
		# Connect to DB
		connection = PG::Connection.new({ host: Product::HOST,
								                      port: Product::PORT,
								                      dbname: Product::DB_NAME,
								                      user: Product::USER,
								                      password: Product::PASSWORD})

		# Create some kind of SQL statement
		command = "SELECT * FROM products"

		# Execute the SQL Statement
		results = connection.exec(command)

		products = []

		results.each do |row|
			product = Product.new(row["id"].to_i,
				                    row["name"],
				                    row["price"].to_f,
				                    row["serial_no"])

			products << product
		end

		return products
	end

end