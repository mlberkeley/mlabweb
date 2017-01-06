# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(name: "David Lee Admin",
               email: "djlee@ml.berkeley.edu",
               password: "lsj0918",
               password_confirmation: "lsj0918",
               admin: true,
               activated: true,
               activated_at: Time.zone.now)

Member.create!(name: "David Lee Exec",
               email: "djlee2@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               exec: true,
               activated: true,
               activated_at: Time.zone.now)
Member.create!(name: "David Lee Member",
               email: "djlee3@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               activated: true,
               activated_at: Time.zone.now)
