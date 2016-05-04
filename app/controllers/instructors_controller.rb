class InstructorsController < ApplicationController
	def show
		if is_instructor?(@customer)
			@customers = User.all
		end
	end
end