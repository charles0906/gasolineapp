class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.string :station
      t.date :date_p
      t.integer :kilometers
      t.decimal :gallons
      t.decimal :cost
      t.decimal :cost_gallon
      t.decimal :km_gallon

      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
