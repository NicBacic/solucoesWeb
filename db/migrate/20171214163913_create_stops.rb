class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.float :stop_long

      t.timestamps
    end
  end
end
