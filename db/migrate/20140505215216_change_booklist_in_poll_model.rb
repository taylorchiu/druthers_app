class ChangeBooklistInPollModel < ActiveRecord::Migration
    def change
  	change_column :polls, :book_list, :text
  end
end
