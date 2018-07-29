class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.references :exercise_type, foreign_key: true
      t.string :name
      t.string :image
      t.string :video
      t.text :description

      t.timestamps
    end
  end
end
