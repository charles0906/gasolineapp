class AddCarModelToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :car_model, :string
  end

  def self.down
    remove_column :users, :car_model
  end
end
