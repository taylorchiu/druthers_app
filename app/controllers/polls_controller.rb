class PollsController < ApplicationController
	

	def search	
  end

  def results
  	# user searches by title, which gets sent to the API via Typhoeus.get and saved in an array, @goodreads_data
  	# the while loop iterates through the giant API response and saves just the title, author, and book_id to the @goodreads_data instance variable, which we call in the results.html.erb view to display the search results.

 		@search_title = params[:title]
		results = Typhoeus.get("https://www.goodreads.com/search.xml?key=#{ENV['GOODREADS_KEY']}&q=#{@search_title}")
		data = Hash.from_xml(results.response_body)
		@goodreads_data = []
			i = 0
			while i <= 10 do
				book = data['GoodreadsResponse']['search']['results']['work'][i]
				@goodreads_data << {title: book['best_book']['title'], author: book['best_book']['author']['name'], book_id: book['best_book']['id'] }
				i += 1
			end
	end

  def details
  	# given a book_id, dislay details about that book: title, author, img_url, link to goodreads
  	# CAN I EVEN FIND BOOK INFO GIVEN A BOOK_ID?????
  	# maybe instead of book details I should just show book reviews off goodreads with url and isbn...in an iframe...
  	
  # 	results = Typhoeus.get("https://www.goodreads.com/search.xml?key=#{ENV['GOODREADS_KEY']}&q=#{params[:book_id]}")
  # 	data = Hash.from_xml(results.response_body)
		# @goodreads_data = []
		# 	i = 0
		# 	while i <= 10 do
		# 		book = data['GoodreadsResponse']['search']['results']['work'][i]
		# 		@goodreads_data << {title: book['best_book']['title'], author: book['best_book']['author']['name'], book_id: book['best_book']['id'], img_url: book['best_book']['img_url'] }
		# 		i += 1
		# 	end
  end

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
		@poll = Poll.create(poll_params)
		redirect_to poll_path(@poll)
	end

	def edit
		@poll = Poll.find(params[:id])
	end

	def update
		@poll = Poll.find(params[:id])
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
