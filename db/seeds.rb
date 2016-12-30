# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(name: "David Lee",
               email: "dssd1001@gmail.com",
               password: "lsj0918",
               password_confirmation: "lsj0918")

Member.create!(name: "Phillip Kuznetsov",
               email: "pk@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar")
Member.create!(name: "Ted Xiao",
               email: "tx@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar")
