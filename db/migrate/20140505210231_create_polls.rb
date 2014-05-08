class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.string :url
      t.datetime :start_date
      t.datetime :end_date
      t.string :book_list
      t.string :winning_book
      t.references :user, index: true

      t.timestamps
    end
  end
end
