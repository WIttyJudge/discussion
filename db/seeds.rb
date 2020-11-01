
admin = User.create(
    username: 'admin',
    email: 'admin@gmail.com',
    password: '123123'
)

admin.add_role :almighty

3.times do
  User.create(
    username: Faker::Games::Dota.hero,
    email: "#{Faker::Games::Dota.hero}@gmail.com",
    password: '123456'
  )
end

50.times do
  Post.create(
    title: Faker::Movie.title,
    author_id: User.ids.sample,
    body: Faker::Markdown.emphasis
  )
end

tags = Tag.create([
  { name: 'database' },
  { name: 'postgresql' },
])