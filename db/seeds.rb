# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

   # create users
   first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=280', bio: 'Teacher from Mexico.')
   second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=280', bio: 'Teacher from Poland.')

   # create posts
   first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
   second_post = Post.create(author: second_user, title: 'I am changing the world!', text: 'This is my second post')
   third_post = Post.create(author: second_user, title: 'Coding in progress', text: 'One line at a time')
   fourth_post = Post.create(author: first_user, title: 'Show love', text: 'You cant love too much')

    # create comments
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
    Comment.create(post: first_post, author: second_user, text: 'Hope you all done with your project?' )
    Comment.create(post: first_post, author: second_user, text: 'I asked after you from Ebun yesterday' )
    Comment.create(post: first_post, author: first_user, text: 'Oh, really, thanks.' )
    Comment.create(post: first_post, author: second_user, text: 'I am almost done with the project' )

    # likes
    Like.create(post: first_post, author: first_user)
    Like.create(post: first_post, author: second_user)
    Like.create(post: second_post, author: first_user)
