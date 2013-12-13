class AddUseridToPost < ActiveRecord::Migration
  ## this is the old method
  def self.up
    add_column :posts, :user_id, :integer
  end
  
  def self.down
    remove_column :posts, :user_id
  end
  # def change
  # end
end
