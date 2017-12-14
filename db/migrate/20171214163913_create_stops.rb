class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_name
      t.string :stop_desc
      t.integer :stop_lat
      t.integer :stop_lon

      t.timestamps
    end
  end
end
