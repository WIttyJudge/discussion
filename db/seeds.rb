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

  def create_association(klass, association, records_count = nil)
    @counter += 1
    plural_klass = klass.name.pluralize.downcase
    plural_association = association.name.pluralize.downcase

    if klass
      message = "Creating #{plural_association} for #{records_count} #{plural_klass}."
      puts "  #{@counter}. #{message}"
      yield
    end
  end
end

seeder = Seeder.new

users_count = 3
seeder.create_if_none(User, users_count) do
  admin = User.create!(
    name: 'Main Admin',
    username: 'admin',
    email: 'admin@gmail.com',
    password: '123123'
  )

  admin.add_role :almighty

  users_count.times do |i|
    User.create!(
      name: Faker::Name.name,
      username: "mysupername#{i}",
      email: Faker::Internet.unique.email,
      password: '123123'
    )
  end
end

posts_count = 50
seeder.create_if_none(Post, posts_count) do
  posts_count.times do
    Post.create!(
      title: Faker::Lorem.paragraph_by_chars(number: rand(21..59), supplemental: false),
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
  Tag.create!(
    [
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
      },
      {
        name: 'ruby',
        guideline: 'All articles and discussions should be about the Ruby
        programming language and related frameworks and technologies like Rails, Hanami, Sinatra etc.',
        about: 'Ruby is an open-source dynamic object-oriented interpreted language that
        combines the good bits from Perl, Smalltalk, and Lisp. It supports multiple
        programming paradigms including functional, object-oriented, and imperative.
        Ruby was initially conceived on February 24, 1993, by Yukihiro Matsumoto and version 1.0 was released in 1996'
      }
    ]
  )
end

seeder.create_association(Post, Tag, posts_count) do
  (1..posts_count).each do |post|
    Post.find(post).tags << Tag.find(Tag.pluck(:id).sample(2))
  end
end