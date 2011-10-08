class AddUserIdToCar < ActiveRecord::Migration
  def self.up
    add_column :cars, :user_id, :integer
  end

  def self.down
    remove_column :cars, :user_id
  end
end
