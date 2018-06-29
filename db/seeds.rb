# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |blog|
  Blog.create!(
      title: "My blog post #{blog}",
      body: "gfucvguawfvceyvwqfciyvqifcyhqwevfcveifciygvabfiygiaqfcihyavbgbdahcbqikasevhisevbfiwsvbchiksvikhv gfuiqgfcbqaf fqwesfbe fvvgf evgeqag eqgg4rewg4rewgr 2wgrw2gr wgrgwrahrew hwhe4h"
    )
end

5.times do |skills|
  Skill.create!(
    title: "Rails #{skills}",
    percent_utilized: 15
    )
end

puts "5 Skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "My great service",
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
