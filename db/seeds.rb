Package.destroy_all
Package.create([
	{
		quantity: 1,
		price: 8500
	},
	{
		quantity: 5,
		price: 40000
	},
	{
		quantity: 10,
		price: 75000
	},
	{
		quantity: 20,
		price: 140000
	}
	])

User.destroy_all
Customer.destroy_all
Instructor.destroy_all

customer = Customer.new(email: "superman@gmail.com", 
								password: "123", 
								password_confirmation: "123",
								name_first: "Jim",
								name_last: "Matthews",
								phone: "310-322-7274")

customer2 = Customer.new(email: "bill@gmail.com", 
								password: "123", 
								password_confirmation: "123",
								name_first: "Bill",
								name_last: "Roberts",
								phone: "310-322-7274")

instructor = Instructor.new(email: "donniemac@gmail.com",
														password:"123",
														password_confirmation:"123",
														name_first: "Don",
														name_last: "McEnroe",
														phone: "310-322-7274")

instructor2 = Instructor.new(email: "roger@gmail.com",
														password:"123",
														password_confirmation:"123",
														name_first: "Roger",
														name_last: "Lederer",
														phone: "310-322-4332")

lessons_array = []
1.times do 
	lessons_array.push(Lesson.new(status: "Available", dateused: ''))
end

order = Order.new(price: 8500,
									quantity: 1,
									customer_id: customer.id,
									instructor_id: instructor.id,
									lessons: lessons_array)

lessons_array.clear
5.times do
	lessons_array.push(Lesson.new(status: "Available", dateused: ''))
end
order2 = Order.new(price: 40000,
									quantity: 5,
									customer_id: customer.id,
									instructor_id: instructor2.id,
									lessons: lessons_array)

lessons_array.clear
5.times do
	lessons_array.push(Lesson.new(status: "Available", dateused: ''))
end
order3 = Order.new(price: 40000,
									quantity: 5,
									customer_id: customer2.id,
									instructor_id: instructor2.id,
									lessons: lessons_array)

customer.save
customer2.save
instructor.save
instructor2.save
order.save
order2.save
order3.save