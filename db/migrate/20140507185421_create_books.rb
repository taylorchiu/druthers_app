class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :poll, index: true
      t.string :title
      t.string :author
      t.string :img_url
      t.string :reviews
      t.string :book_id

      t.timestamps
    end
  end
end
