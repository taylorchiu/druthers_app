class PollsController < ApplicationController
	
	def index
		@polls = Poll.all
	end

	def show
		@poll = Poll.find(params[:id])
		# is this correct if the user is going to navigate directly to the show page
		# using a unique URL?
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = current_user.polls.create(poll_params)
		redirect_to poll_path(@poll)
	end

	def edit
		@poll = Poll.find(params[:id])
	end

	def update
		@poll = current_user.polls.find(params[:id])
		@poll.update poll_params
		redirect_to poll_path(@poll)
	end

	def destroy
		Poll.find(params[:id]).destroy
		redirect_to root_path
	end

	private
		def poll_params
			# did not permit :url bc that shouldn't be changeable by the user
			params.require(:poll).permit(:name, :start_date, :end_date, :book_list, :winning_book)
		end

end
