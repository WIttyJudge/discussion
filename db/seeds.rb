class Seeder
  def initialize
    @counter = 0
  end

  def create_if_none(klass, records_count = nil)
    @counter += 1
    plural_name = klass.name.pluralize.downcase

    if klass
      message = "Creating #{records_count} #{plural_name}."
      puts "  #{@counter}. #{message}"
      yield
    else
      puts "Cannot seed #{plural_name}"
    end
  end
end

seeder = Seeder.new

seeder.create_if_none(User) do
  admin = User.create!(
    username: 'admin',
    email: 'admin@gmail.com',
    password: '123123'
  )

  admin.add_role :almighty

  3.times do
    User.create!(
      username: Faker::Name.name,
      email: "#{Faker::Internet.email}",
      password: '123123'
    )
  end
end

posts_count = 50
seeder.create_if_none(Post, posts_count) do
  posts_count.times do
    Post.create!(
      title: Faker::Alphanumeric.alphanumeric(number: 15),
      author_id: User.ids.sample,
      body: Faker::Markdown.emphasis
    )
  end
end

replies_count = 3
seeder.create_if_none(Reply, replies_count) do
  replies_count.times do
    Reply.create!(
      reply: Faker::Markdown.emphasis,
      post_id: Post.last.id,
      user_id: User.last.id
    )
  end
end

seeder.create_if_none(Tag, 2) do
  Tag.create!([
                {
                  name: 'linux',
                  guideline: 'Articles and discussions should be directly
        related to Linux operating systems.',
                  about: 'Linux is a family of free and open source operating systems built
        on top of the Linux kernel, first released on 1991 by Linus Torvalds.'
                },
                {
                  name: 'database',
                  guideline: 'Articles should be related to database development,
        performance, scalability, optimisation or data analysis, or using sql to query data.',
                  about: 'A database is an organized collection of data,
        generally stored and accessed electronically from a computer system.'
                }
              ])
end
