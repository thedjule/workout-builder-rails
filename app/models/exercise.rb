class Exercise < ApplicationRecord
  belongs_to :exercise_type
  has_and_belongs_to_many :workouts
  has_and_belongs_to_many :muscle_groups

  validates :name, presence: true
  validates :image, presence: true
  validates :video, presence: false
  validates :description, presence: true

  # Override the as_json method of Exercise Class to only return
  # name, image, video, description, Type and related Muscle Groups
  def as_json(*)
    super(
        only: [:name, :url, :note],
        include: {
            :muscle_groups => { :only => [:name] },
            :exercise_type => { :only => [:name] }
        }
    )
  end
end
