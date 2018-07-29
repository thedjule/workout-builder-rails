# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Exercise Types
ExerciseType.create([
                        { name: 'Strength' },
                        { name: 'Flexibility' },
                        { name: 'Cardio' }
                    ])

# Create Muscle Groups
MuscleGroup.create([
                        { name: 'Full Body' },
                        { name: 'Abdominal' },
                        { name: 'Arms' },
                        { name: 'Back' },
                        { name: 'Chest' },
                        { name: 'Hamstrings' },
                        { name: 'Hips' },
                        { name: 'Legs' },
                        { name: 'Low Back' },
                        { name: 'Lower Legs' },
                        { name: 'Neck' },
                        { name: 'Quadriceps' },
                        { name: 'Shoulders' }
                    ])

# Create 30 Exercises
30.times do
  exercise = Exercise.create({
                                 name: Faker::Pokemon.move,
                                 image: Faker::LoremFlickr.image,
                                 video: Faker::LoremFlickr.image,
                                 description: Faker::Lorem.paragraphs,
                                 exercise_type: ExerciseType.find(ExerciseType.pluck(:id).shuffle.first)
                              })
  exercise.muscle_groups << MuscleGroup.where(id: MuscleGroup.pluck(:id).sample(3))
end

# Create a Workout for John
workout = Workout.create({
                             name: 'Shoulder workout for John',
                             url: 'ang9cbhoa8', note: Faker::StarWars.quote
                         })
workout.exercises << Exercise.where(id: Exercise.pluck(:id).sample(6))

# Create 20 Workouts
20.times do
  workout = Workout.create({
                               name: Faker::WorldOfWarcraft.quote,
                               url: Faker::Lorem.characters(20),
                               note: Faker::StarWars.quote
                           })
  workout.exercises << Exercise.where(id: Exercise.pluck(:id).sample(6))
end