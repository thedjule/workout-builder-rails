class Workout < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :name, presence: true
  validates :note, presence: false

  # Override the as_json method of Workout Class to only return
  # name, url, note and related Exercises
  def as_json(*)
    super(
        only: [:name, :url, :note],
        include: { :exercises => { :only => [:id, :name, :image, :video, :description] } }
    )
  end
end
