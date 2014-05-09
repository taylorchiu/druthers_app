require 'spec_helper'

describe BooksController do
	describe 'GET index' do
		it 'returns a 200 Ok status' do
			book = Book.create
			get :index
			expect(response.status).to eq(200)
		end

		it 'renders the index template' do
			get :index
			expect(response).to render_template("index")
		end
	end


end
