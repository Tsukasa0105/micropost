class RemoveMicropostIdFromMicroposts < ActiveRecord::Migration[5.2]
  def change
    remove_column :microposts, :Micropost_id, :integer
  end
end
