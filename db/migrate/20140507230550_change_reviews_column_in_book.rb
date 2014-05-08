class ChangeReviewsColumnInBook < ActiveRecord::Migration
  def change
  	change_column :books, :reviews, :text
  end
end
