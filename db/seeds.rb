# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

def rand_groups(course)
  count = rand(1..5)
  count.times { Group.create(start_time: rand_datetime, course: course) }
end

def rand_datetime
  Faker::Time.between(from: DateTime.now, to: DateTime.now + 10)
end

10.times do
  course = Course.create(name: "#{Faker::Educator.unique.subject} course")
  rand_groups(course)
end
