class AddTopicidToPost < ActiveRecord::Migration
  ## this is the old method
  def self.up
    add_column :posts, :topic_id, :integer
  end
  
  def self.down
    remove_column :posts, :topic_id
  end
  # def change
  # end
end
