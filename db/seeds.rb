# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bootcamps = Tag.create(:name => "Bootcamps")
classes = Tag.create(:name => "In Person Classes")
books = Tag.create(:name => "Books")
online_resources = Tag.create(:name => "Online Resources")
meetups = Tag.create(:name => "Meetups and Study Groups")
other = Tag.create(:name => "Other")
