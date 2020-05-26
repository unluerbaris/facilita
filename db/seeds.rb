# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destyoying all seeds "

Event.destroy_all
User.destroy_all
Audience.destroy_all

puts "All Destroyed ^_^"

# Users

puts "Creating users!"

User.create!(
  first_name: "Baris",
  last_name: "Unluer",
  email: "baris@baris.com",
  password: "localife"
  )

User.create!(
  first_name: "Chihiro",
  last_name: "Tsuda",
  email: "chi@chi.com",
  password: "localife"
  )

User.create!(
  first_name: "Grant",
  last_name: "Holley",
  email: "grant@grant.com",
  password: "localife"
  )

puts "#{User.count} user created!"

# Events

puts "Creating some events!"

Event.create!(
  title: "Web Development for Beginners",
  description: "Let's create a landing page from scratch.",
  user: User.find_by(email: "baris@baris.com"),
  )

Event.create!(
  title: "Game Development with Unity",
  description: "Let's make a platformer game.",
  user: User.find_by(email: "baris@baris.com"),
  )

Event.create!(
  title: "Ruby Basics",
  description: "Learn how to code with Ruby.",
  user: User.find_by(email: "chi@chi.com"),
  )

Event.create!(
  title: "Your first game with Ruby",
  description: "Make a snake clone using Gosu Game Engine and coding with Ruby.",
  user: User.find_by(email: "chi@chi.com"),
  )

Event.create!(
  title: "JavaScript Animations",
  description: "Do some cool animations and transitions on your web page.",
  user: User.find_by(email: "grant@grant.com"),
  )

Event.create!(
  title: "Advanced CSS tips",
  description: "Learn how to use CSS like a pro.",
  user: User.find_by(email: "grant@grant.com"),
  )

puts "#{Event.count} events created!"

# Audiences

puts "Creating audiences!"

Audience.create!(
  event: Event.find_by(title: "Web Development for Beginners"),
  user: User.find_by(email: "chi@chi.com")
  )

Audience.create!(
  event: Event.find_by(title: "Ruby Basics"),
  user: User.find_by(email: "grant@grant.com")
  )

Audience.create!(
  event: Event.find_by(title: "Your first game with Ruby"),
  user: User.find_by(email: "baris@baris.com")
  )

Audience.create!(
  event: Event.find_by(title: "Advanced CSS tips"),
  user: User.find_by(email: "chi@chi.com")
  )

puts "#{Audience.count} audience created!"

puts "Done!"
