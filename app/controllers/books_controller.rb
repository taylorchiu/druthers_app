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
  	if data['GoodreadsResponse']['search']['results_end'].to_i == 0
  		return redirect_to(error_path)
  	else
			@goodreads_data = []
			i = 0
			while i <= 10 do
				book = data['GoodreadsResponse']['search']['results']['work'][i]
				@goodreads_data << {title: book['best_book']['title'], author: book['best_book']['author']['name'], book_id: book['best_book']['id'] }
				i += 1
			end
		end
	end

	def details
	 	@book_id = params[:id]
  	results = Typhoeus.get("https://www.goodreads.com/book/show/#{@book_id}?format=xml&key=#{ENV['GOODREADS_KEY']}")
  	data = Hash.from_xml(results.response_body)
  	@data_main = data['GoodreadsResponse']['book']
  	@title = @data_main['title']
  	if @data_main['authors']['author'].is_a?(Hash) == true
  			@author = @data_main['authors']['author']['name']
  		else
  			@author = @data_main['authors']['author'][0]['name']
  		end
  	@img_url = @data_main['image_url']
  		if @img_url.include? "nocover"
  			@img_url = 'http://s3.amazonaws.com/thumbnails.illustrationsource.com/huge.6.33646.JPG'
  		else
  			@img_url = @img_url
  		end
  	@book_id = @data_main['id']
  	@avg_rating = @data_main['average_rating']
  	@link = @data_main['link']
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


  ## Can Anyone Update a Book?
	def update
		@book = Book.find(params[:id])
		# respond_to do |format|
		# if @book.update_attributes(params[:poll_id])

	end

	def index
		@savedbooks = []
		user_favorites = Favorite.find(:all, :conditions => [ "user_id = ? ", current_user.id])
		user_favorites.each do |fave|
			@savedbooks << Book.find(fave[:book_id])
		end
	end

		def destroy
		Favorite.find(params[:id]).destroy
		redirect_to books_path
	end


	private
		def book_params
			params.require(:book).permit(:title, :author, :img_url, :book_id, :avg_rating, :link)
		end
end
