# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# puts "Delete all data"

Favorite.all.delete_all
Comment.all.delete_all
Subscription.all.delete_all
Article.all.delete_all
Category.all.delete_all
Tag.all.delete_all
Profile.all.delete_all
User.all.delete_all
Feedback.all.delete_all
Newsletter.all.delete_all

puts "Data deleted"

# puts "I run successfully...but nothing 😒"

# unless User.exists?(email: "admin@earnestruby.com")
#   user = User.create!(username: "admin", email: "admin@earnestruby.com", password: "passme123", admin: true)
#   user.add_role :writer
# end

# puts "Admin created successfully"

# Profile.create(
#   user_id: User.first.id,
#   first_name: "Admin",
#   last_name: "Ruby",
#   bio: %q{What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?}
# )

# puts "Profile created"

# %w(reader writer).each do |username|
#   user =  User.create!(username: username, email: "#{username}@earnestruby.com", password: "passme123", admin: false)
#   user.add_role username.to_sym
# end

# puts "Create reader and writer"

# %w(Ruby Rails RubyGems Roda Hanami Sinatra Productivity Career Inspiration).each do |name|
#   Category.create!(
#     name: name,
#     description: %q(Lorem Ipsum is simply dummy text of the printing and types etting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.)
#   )
#  end

#  puts "Category created"

#  %w(Beginner Intermediate Advanced All).each do |name|
#   Level.create!(
#     name: name
#   )
#  end

#  puts "Level created"



# body = <<BODY
# ## Overview
# Lorem ipsum dolor sit amet, ==consectetur== adipiscing elit. Mauris sed placerat tellus. Mauris mollis sapien ac ipsum ornare, sit amet facilisis lectus fringilla. Quisque molestie ut enim in consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec fringilla ut purus sed rhoncus. In porta quam ac nibh lobortis euismod. Fusce sodales nisi eros, pulvinar scelerisque orci bibendum id. Maecenas sollicitudin gravida pretium. Etiam sapien augue, dapibus vitae feugiat ut, mollis sed lectus. Quisque molestie sem in vehicula vehicula. Etiam condimentum ligula a erat imperdiet, id semper sapien euismod. Nullam sed elit sapien. Curabitur massa elit, hendrerit eu venenatis eget, suscipit quis sapien. Duis ante libero, lacinia a velit in, lacinia vehicula ex.

# ## Section 1
# Cras posuere et sapien a `aliquam`. Curabitur tortor dolor, vehicula ac lacus nec, vehicula ultrices velit. Donec aliquet purus est, sit amet posuere ipsum pellentesque id. Nulla id libero ut libero volutpat pharetra. Quisque tortor diam, gravida a tincidunt nec, consequat ac risus. Sed eu lectus elit. Nam quis velit augue. Etiam efficitur mollis dolor, nec mollis lorem fermentum vitae. Aenean dolor nunc, efficitur vitae efficitur eget, hendrerit eget mi. Nam sagittis vestibulum nisi vel scelerisque. Aenean rutrum sem vel accumsan pretium. Cras ultricies aliquam lacus sit amet porttitor.

# ## Section 2
# Mauris vel ipsum pharetra, pharetra tortor non, finibus velit. Vestibulum in nisi sed urna auctor posuere et eget dolor. Nunc nec dapibus ex. Cras commodo nec mi sed dapibus. Proin ultrices nisl sapien, in euismod purus ultricies a. Ut vitae ex pulvinar, efficitur eros tincidunt, dapibus magna. Sed euismod nec est vel molestie. Suspendisse auctor nunc nec ullamcorper congue. Etiam a nisi id mauris tincidunt cursus.

# ## Section 3
# Suspendisse potenti. Quisque volutpat nec lectus non fringilla. Nam porta condimentum metus, sit amet hendrerit tellus. Praesent rhoncus orci quam, vel pharetra risus pulvinar sed. In in augue quis tortor suscipit pharetra. Vivamus finibus cursus hendrerit. Donec in dui erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi eget pulvinar felis, cursus commodo libero.

# ## Code Sample
# ```ruby
# class Person
#   attr_accessor :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def introduction
#     "Hi, my name is #{@name} and I am #{@age} years old"
#   end
# end
# ## instantiate object
# person = Person.new("Jane Doe", 20)
# person.introduction
# #=> Hi, my name is Jane Doe and I am 20 years old.
# ```
# BODY

# @articles = []
# 1.times do |n|
#   Category.all.each do |category|
#     Level.all.each do |level|
#      article = Article.create!(
#         author_id: User.first.id,
#         category_id: category.id,
#         level_id: level.id,
#         mode: 1,
#         published_at: Time.zone.now,
#         title: %Q{Tutorial article for #{n}},
#         summary: %q{Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.},
#         body: body
#       )
#       @articles << article
#     end
#   end
# end

# puts "Done creating #{@articles.count} articles"

# custom_tags = ["rails", "ruby", "bootcamp", "roda", "action cable"]

# @articles.each do |article|
#   ["rails", "ruby", "bootcamp", "roda", "action cable"].each do |name|
#     tag = Tag.find_or_initialize_by(name: name)
#     article.tags << tag
#   end
# end

# puts "Done adding tags to each article"

# puts "**" * 100

# puts "Seeding your dummy data is done!"
