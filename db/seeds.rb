# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..100).each do |i|
	Event.create!(name: "Event  Test #{i}", starttime: Time.now, gallery_tags: "#{(0..i)}", description: "Description goes here")
end