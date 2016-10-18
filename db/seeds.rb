10.times{User.create!(
  username: Faker::Name.name,
  password: "password")}

20.times{Post.create!(
  title: Faker::Name.title,
  content: Faker::Hipster.paragraph(2, true),
  author_id: rand(1..10))}

50.times{Comment.create!(
  content: Faker::Hipster.paragraph,
  post_id: rand(1..20),
  commenter_id: rand(1..10))}

