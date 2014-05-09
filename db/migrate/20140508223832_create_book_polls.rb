class CreateBookPolls < ActiveRecord::Migration
  def change
    create_table :book_polls do |t|
      t.integer :book_id
      t.integer :poll_id
      t.integer :votecount

      t.timestamps
    end
  end
end
