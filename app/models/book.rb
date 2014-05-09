class Book < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  has_many :book_polls
  has_many :polls, through: :book_polls
end
