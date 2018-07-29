class ExerciseType < ApplicationRecord
  has_many :exercises

  validates :name, presence: true

  # Override the as_json method of ExerciseType Class to only return the Name
  def as_json(*)
    super(only: [:name])
  end
end
