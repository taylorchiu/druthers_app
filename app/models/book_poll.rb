class BookPoll < ActiveRecord::Base
	 belongs_to :book
	 belongs_to :poll
end
