# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    User.create(name: 'Tom', photo: 'https://i.pinimg.com/originals/d6/e2/fc/d6e2fc3ea742fa16afe82d4b41c85e63.jpg', bio: 'Teacher from Mexico.')
    User.create(name: 'Raph', photo: 'https://envisioningtheamericandream.files.wordpress.com/2016/06/comic-book-i-love-you-psa.jpg?w=710&h=536', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
# Post.create(id: 2, title: 'Hi', text: 'How are you doing')