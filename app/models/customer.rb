class Customer < User
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password
	has_many :orders

end