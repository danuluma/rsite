# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

User.create!(
  email: "test@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "Admin User",
  roles: "site_admin"
  )

puts "1 admin user created"

User.create!(
  email: "user@user.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "Reg User"
  )

puts "1 reg user created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
    )
end
puts "3 topics created"

10.times do |blog|
  Blog.create!(
      title: "My blog post #{blog}",
      body: "gfucvguawfvceyvwqfciyvqifcyhqwevfcveifciygvabfiygiaqfcihyavbgbdahcbqikasevhisevbfiwsvbchiksvikhv gfuiqgfcbqaf fqwesfbe fvvgf evgeqag eqgg4rewg4rewgr 2wgrw2gr wgrgwrahrew hwhe4h",
      topic_id: Topic.last.id
    )
end
puts "10 blogs created"

5.times do |skills|
  Skill.create!(
    title: "Rails #{skills}",
    percent_utilized: 15
    )
end

puts "5 Skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Rails",
    body: "The curriculum includes everything that’s required to fully grasp the fundamentals of
computer science, and gain a thorough understanding of computer science best
practices through Python. By covering this curriculum, you will be comfortable with
computing concepts -- empowering you to engage with a vibrant community of like-
minded learners with all levels of experience.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
    )
end
1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "The curriculum includes everything that’s required to fully grasp the fundamentals of
computer science, and gain a thorough understanding of computer science best
practices through Python. By covering this curriculum, you will be comfortable with
computing concepts -- empowering you to engage with a vibrant community of like-
minded learners with all levels of experience.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
    )
end

puts "9 Portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
    )
end
20.times do Portfolio.create(
title: Faker::Book.title,
subtitle: Faker::TvShows::FamilyGuy.quote,
body: Faker::Lorem.sentence

)
puts "@@@@@"
end

puts "3 Technologies items created"