class AddBooklistToUser < ActiveRecord::Migration
  def change
    add_column :users, :booklist, :text
  end
end
