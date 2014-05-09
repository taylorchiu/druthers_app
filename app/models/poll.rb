class Poll < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  has_many :book_polls
  has_many :books, through: :book_polls
  has_many :guests
end
