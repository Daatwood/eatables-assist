# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |t|
  u = User.create(username: Faker::Internet.user_name,
                  email: Faker::Internet.email,
                  password: 'Password1')
  puts "Gen User: #{u.username}"

  5.times do |x|
    r = u.recipes.create!(name: Faker::Hipster.word+" "+Faker::App.name,
                          description: Faker::Hipster.paragraph)
    # Create Required Food
    (3+rand(8)).times do |i|
      food = rand(3)%2 == 0 ? Faker::Food.ingredient : Faker::Food.spice
      item = Eatable.find_or_create_by(name: food)
      r.ingredients.create(measurement: Faker::Food.measurement, eatable: item)
    end
    # Create Instructions

    if x%2 == 0
      (1+rand(16)).times do |i|
        r.directions.create(instruction: Faker::Hipster.sentence)
      end
    else
      directions_input = Faker::Lorem.sentences(1+rand(16)).join("\n")
      r.directions_create_from_input(directions_input)
    end

    puts "Gen Recipe: #{r.name}"
  end
end
