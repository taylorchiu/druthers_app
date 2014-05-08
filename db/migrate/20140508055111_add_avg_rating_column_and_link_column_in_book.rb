class AddAvgRatingColumnAndLinkColumnInBook < ActiveRecord::Migration
  def change
  	add_column :books, :avg_rating, :string
  	add_column :books, :link, :string
  	remove_column :books, :reviews
  end
end
