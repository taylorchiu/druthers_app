class HomeController < ApplicationController
	def index
		if signed_in?
			redirect_to polls_path
		else
			redirect_to new_user_path
		end
	end

end
