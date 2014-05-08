class Poll < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  has_many :guests
end
