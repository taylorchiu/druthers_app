class BooksController < ApplicationController
	def search
	end

	def results
		# user searches by title, which gets sent to the API via Typhoeus.get and saved in an array, @goodreads_data
  	# the while loop iterates through the giant API response and saves just the title, author, and book_id to the @goodreads_data 
  	#instance variable, which we call in the results.html.erb view to display the search results.
		if params[:title] == nil
			@search = params[:author]
		else
			@search = params[:title]
		end
		@search = @search.gsub(" ", "%20")
		results = Typhoeus.get("https://www.goodreads.com/search.xml?key=#{ENV['GOODREADS_KEY']}&q=#{@search}")
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
	 	@book_id = params[:id]
  	results = Typhoeus.get("https://www.goodreads.com/book/show/#{@book_id}?format=xml&key=#{ENV['GOODREADS_KEY']}")
  	data = Hash.from_xml(results.response_body)
  	@title = data['GoodreadsResponse']['book']['title']
  	@author = data['GoodreadsResponse']['book']['authors']['author'][0]['name']
  	@img_url = data['GoodreadsResponse']['book']['image_url']
  	@book_id = data['GoodreadsResponse']['book']['id']
  	@avg_rating = data['GoodreadsResponse']['book']['average_rating']
  	@link = 'https://www.goodreads.com/book/title/' + @title.gsub(" ", "+")
  	@book = Book.new
  end

  def link
  	@book = Book.find_by link: params[:link]
  	link = @book['link']
  	redirect_to link
  end

	def new
	end

	def create
		@book = Book.create(book_params)
		@favorite = Favorite.new
		@favorite.book_id = @book.id
		@favorite.user_id = current_user.id
		@favorite.save
		redirect_to books_path
	end

	def update
		@book = Book.find(params[:id])
		# respond_to do |format|
		# if @book.update_attributes(params[:poll_id])

	end

	def destroy
		Book.find(params[:id]).destroy
		redirect_to books_path
	end

	def index
		@savedbooks = []
		user_favorites = Favorite.find(:all, :conditions => [ "user_id = ? ", current_user.id])
		user_favorites.each do |fave|
			@savedbooks << Book.find(fave[:book_id])
		end
	end


	private
		def book_params
			params.require(:book).permit(:title, :author, :img_url, :book_id, :avg_rating, :link)
		end
end
