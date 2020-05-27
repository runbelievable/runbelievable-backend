class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :age
      t.string :gender
      t.integer :max_run_distance
      t.string :estimated_mile_pace

      t.timestamps
    end
  end
end
