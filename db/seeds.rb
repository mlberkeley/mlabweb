# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(fname: "ML",
               lname: "@ Berkeley",
               email: "admin@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               introduction: Faker::Lorem.paragraph(10),
               admin: true,
               confirmed_at: Time.zone.now,
               updated_at: Time.zone.now)
Member.create!(fname: "Supreme",
              lname: "President",
              email: "supres@ml.berkeley.edu",
              password: "foobar",
              password_confirmation: "foobar",
              position: "President",
              exec: true,
              confirmed_at: Time.zone.now,
              updated_at: Time.zone.now)
4.times do
  Member.create!(fname: Faker::Name.first_name,
                 lname: Faker::Name.last_name,
                 email: Faker::Lorem.word + Faker::Lorem.word + "@ml.berkeley.edu",
                 password: "foobar",
                 password_confirmation: "foobar",
                 exec: true,
                 confirmed_at: Time.zone.now,
                 updated_at: Time.zone.now)
end
3.times do
  Member.create!(fname: Faker::Name.first_name,
                 lname: Faker::Name.last_name,
                 email: Faker::Lorem.word + Faker::Lorem.word + "@ml.berkeley.edu",
                 password: "foobar",
                 password_confirmation: "foobar",
                 officer: true,
                 confirmed_at: Time.zone.now,
                 updated_at: Time.zone.now)
end
Member.create!(fname: "Some",
              lname: "Member",
              email: "member@ml.berkeley.edu",
              password: "foobar",
              password_confirmation: "foobar",
              confirmed_at: Time.zone.now,
              updated_at: Time.zone.now)

4.times do
  Project.create(name: Faker::Lorem.word.capitalize + " " + Faker::Lorem.word.capitalize, sname: "A Nickname", tag: "research", description: "#{Faker::Lorem.paragraph(20)}", year: 2017, semester: "Fall")
end
4.times do
  Project.create(name: Faker::Lorem.word.capitalize + " " + Faker::Lorem.word.capitalize, tag: "industry", description: "#{Faker::Lorem.paragraph(20)}", year: 2017, semester: "Fall")
end
4.times do
  Project.create(name: Faker::Lorem.word.capitalize + " " + Faker::Lorem.word.capitalize, tag: "research", description: "#{Faker::Lorem.paragraph(20)}", year: 2017, semester: "Spring")
end
4.times do
  Project.create(name: Faker::Lorem.word.capitalize + " " + Faker::Lorem.word.capitalize, tag: "industry", description: "#{Faker::Lorem.paragraph(20)}", year: 2016, semester: "Fall")
end

50.times do
  Subscriber.create!(name: Faker::Name.name, email: Faker::Lorem.word + Faker::Lorem.word + "@gmail.com")
end

Member.all.each do |m|
  Project.all.each do |p|
    m.posts.create!(content: Faker::Lorem.paragraph, project: p.id, created_at: rand(15.months.ago..Time.now))
  end
end

Member.first.posts.create!(content: Faker::Lorem.paragraph(10), video: "https://www.youtube.com/watch?v=J6R6nsFph7s", project: 0)
