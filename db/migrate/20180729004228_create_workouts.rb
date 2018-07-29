class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :url
      t.text :note

      t.timestamps
    end
  end
end
