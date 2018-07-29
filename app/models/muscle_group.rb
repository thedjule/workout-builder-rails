class MuscleGroup < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :name, presence: true

  # Override the as_json method of MuscleGroup Class to only return the Name
  def as_json(*)
    super(only: [:name])
  end
end
