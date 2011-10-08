class RemoveCarModelFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :car_model
  end

  def self.down
    remove_column :users, :car_model, :string
  end
end
