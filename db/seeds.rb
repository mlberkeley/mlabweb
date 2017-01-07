# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(name: "David Lee 1",
               email: "djlee@ml.berkeley.edu",
               password: "lsj0918",
               password_confirmation: "lsj0918",
               introduction: "I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. I love Machine Learning At Berkeley. ",
               admin: true,
               activated: true,
               activated_at: Time.zone.now)

Member.create!(name: "David Lee 2",
               email: "djlee2@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               exec: true,
               activated: true,
               activated_at: Time.zone.now)
Member.create!(name: "David Lee 3",
               email: "djlee3@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               activated: true,
               activated_at: Time.zone.now)


members = Member.order(:created_at).take(2)
10.times do
  content = Faker::Lorem.sentence(7)
  members.each { |member| member.blogposts.create!(content: content) }
end
