class PollsController < ApplicationController
	

	def search	
  end

  def results
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
			 @goodreads_data
			# @book_id = @goodreads_data[:book_id].to_i
	end



		# @goodreads_data = data['GoodreadsResponse']['search']['results']['work'].map do |book|
		# 	{title: book['best_book']['title'].titleize, author: book['best_book']['author']['name'], img_url: book['best_book']['img_url']}

  def details
  	results = Typhoeus.get("https://www.goodreads.com/search.xml?key=#{ENV['GOODREADS_KEY']}&q=#{params[:book_id]}")
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
