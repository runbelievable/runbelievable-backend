class CreateUserRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :user_runs do |t|
      t.references :user, foreign_key: true
      t.references :run, foreign_key: true

      t.timestamps
    end
  end
end
