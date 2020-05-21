class CreateRun < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.float :distance
      t.string :location
      t.string :total_time
      t.string :average_pace

      t.timestamps
    end
  end
end
