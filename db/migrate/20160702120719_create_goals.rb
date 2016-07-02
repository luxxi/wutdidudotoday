class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.datetime :due
      t.time :notify_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
