class GuestsController < ApplicationController
	 def new
 		 @guest = Guest.new
 	end

	 def create
 		 @guest = Guest.create(guest_params)
 		 redirect_to poll_path(@guest.poll_id)
 	end

	 private
	 def guest_params
 			params.require(:guest).permit(:name, :poll_id)
 		end
end
