class PollsController < ApplicationController
	
	def index
		@polls = current_user.polls.all
	end

	def show
		@poll = Poll.find_by_url(params[:url])
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = current_user.polls.create(poll_params)
		@poll.user_id = current_user.id
		@poll.url = SecureRandom.urlsafe_base64(8)
		@poll.save
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

	def add
		@poll = Poll.find_by(user_id: current_user.id)
		# binding.pry
		@favorite = Favorite.find_by_book_id(params[:book_id])

	# @favorite.book_id is a string and it needs to be an integer to find it in Book.all
		@book = Book.find_by(id: @favorite.book_id)
		@poll.books << @book
		redirect_to poll_path(@poll.url)
	end

	def destroy
		Poll.find(params[:id]).destroy
		redirect_to polls_path
	end

	private
		def poll_params
			# did not permit :url bc that shouldn't be changeable by the user
			params.require(:poll).permit(:name, :start_date, :end_date, :book_list, :winning_book)
		end

end
