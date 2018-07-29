class CreateExercisesAndMuscleGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises_muscle_groups, id: false do |t|
      t.belongs_to :exercise, index: true
      t.belongs_to :muscle_group, index: true
    end
  end
end
