class Purchase
  include Mongoid::Document
  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year, :instructor

  def save
    coach = Instructor.find(instructor)
    user = User.find_by(email: email)
    user.name_first = name_first
    user.name_last = name_last
    user.phone = phone
    lessons_array = []
    quantity.to_i.times do 
      lessons_array.push(Lesson.new(status: "Available", dateused: ''))
    end
        
    order = Order.new(price: price,
                      quantity: quantity,
                      customer_id: user.id,
                      instructor_id: coach.id,
                      lessons: lessons_array)

    user.save
    order.save
  end
end