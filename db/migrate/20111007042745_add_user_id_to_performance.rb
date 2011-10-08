class AddUserIdToPerformance < ActiveRecord::Migration
  def self.up
    add_column :performances, :user_id, :integer
  end

  def self.down
    remove_column :performances, :user_id
  end
end
