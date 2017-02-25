# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(name: "ML Admin",
               email: "admin@ml.berkeley.edu",
               password: "foobar",
               password_confirmation: "foobar",
               introduction: Faker::Lorem.paragraph(10),
               admin: true,
               activated: true,
               activated_at: Time.zone.now)
Member.create!(name: "Supreme President",
              email: "supres@ml.berkeley.edu",
              password: "foobar",
              password_confirmation: "foobar",
              position: "President",
              exec: true,
              activated: true,
              activated_at: Time.zone.now)

6.times do
  Member.create!(name: Faker::Name.name,
                 email: Faker::Lorem.word + "@ml.berkeley.edu",
                 password: "foobar",
                 password_confirmation: "foobar",
                 activated: true,
                 activated_at: Time.zone.now)
end

Blogpost.create!(title: "Hello World!",
                 content: 'One of the hottest and most exciting topics floating around these days is machine learning. People have created amazing things through machine learning, such as self-driving cars, mind-controlled prosthetics, and actual, readable dialogues in the style of Shakespeare. But just what is machine learning? Surely it’s something obscure and esoteric. Right? And surely the subject is so entangled in computer science and mathematics that it would make any reasonable student run the other way. Right?

                 When \(a \ne 0\), there are two solutions to \(ax^2 + bx + c = 0\) and they are $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

That’s where Machine Learning at Berkeley comes in. ML@B is the first undergraduate machine learning club at UC Berkeley. We were founded with the goal of making machine learning accessible to everyone. We host tech talks, hold workshops, work on projects for companies, and conduct independent research projects. This semester, there are about 30 students working with businesses such as Intuit, SAP, and Github, and about 30 students working on research.

As for this blog, this is the place where we’ll be letting the world know about what we’re doing. We’ll be posting about ML@B projects, research, and most importantly, events. These events will include workshops and lectures from important researchers in machine learning, and we definitely encourage anybody in the area to come! In addition, we’ll be posting a series of introductory machine learning tutorials based off of the bootcamp we give to all of our new members.

So, definitely keep an eye on this blog if you’re interested in machine learning. And even if you’re not sure about it, you should check in periodically. We might be able to change your mind!',
                  member_id: 1,
                  published: true)

4.times do
  Project.create(name: "Some Project", tag: "research", description: "#{Faker::Lorem.paragraph(20)}", current: true)
end
4.times do
  Project.create(name: "Some Project", tag: "industry", description: "#{Faker::Lorem.paragraph(20)}", current: true)
end
4.times do
  Project.create(name: "Some Old Project", tag: "research", description: "#{Faker::Lorem.paragraph(20)}", current: false)
end
4.times do
  Project.create(name: "Some Old Industry Project", tag: "industry", description: "#{Faker::Lorem.paragraph(20)}", current: false)
end

Special.create(title: "About ML@B",
               content: "Machine Learning at Berkeley was founded in 2003 by a group of engineers in Silicon Valley who wanted to prove that #{Faker::Lorem.paragraph(8)}

              #{Faker::Lorem.paragraph(30)}

              #{Faker::Lorem.paragraph(15)}

              #{Faker::Lorem.paragraph(50)}

              #{Faker::Lorem.paragraph(10)}

              #{Faker::Lorem.paragraph}")


Special.create(title: "Join a Project",
               tag: "nmo",
               content: "need help editing all this")

Special.create(title: "General Meetings",
               tag: "nmo",
               content: "needs edit")

Special.create(title: "Boot Camp",
               tag: "nmo",
               content: "needs edit")

Special.create(title: "Demo Days",
               tag: "nmo",
               content: "needs edit")

Special.create(title: "Decal",
               tag: "nmo",
               content: "needs edit")
