class AddPollIdToGuestModel < ActiveRecord::Migration
  def change
    add_column :guests, :poll_id, :integer
  end
end
