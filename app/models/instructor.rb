class Instructor < User
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password
	has_many :orders

	field :hourly_rate, type: Integer
	field :years_of_experience, type: Integer
end