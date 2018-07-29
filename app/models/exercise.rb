class Exercise < ApplicationRecord
  belongs_to :exercise_type
  has_and_belongs_to_many :workouts
  has_and_belongs_to_many :muscle_groups
end
