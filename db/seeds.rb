
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
    password: '123123'
  )
end

50.times do
  Post.create(
    title: Faker::Movie.title,
    author_id: User.ids.sample,
    body: Faker::Markdown.emphasis
  )
end

Tag.create([
  {
    name: 'linux',
    guideline: 'Articles and discussions should be directly related to Linux operating systems.',
    about: 'Linux is a family of free and open source operating systems built on top of the Linux kernel, first released on 1991 by Linus Torvalds.'
  },
  {
    name: 'database',
    guideline: 'Articles should be related to database development, performance, scalability, optimisation or data analysis, or using sql to query data.',
    about: 'A database is an organized collection of data, generally stored and accessed electronically from a computer system.'
  },
])