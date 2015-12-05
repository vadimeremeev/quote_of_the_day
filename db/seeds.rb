# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


quote_types = QuoteType.create([{ name: 'Motivation'}, { name: 'Joke'}])
quotes = Quote.create([
	         { quote_types_id: 1, title: "Without continual growth and progress, such words as improvement, achievement, and success have no meaning."},
	         { quote_types_id: 1, title: "The artist is a receptacle for emotions that come from all over the place: from the sky, from the earth, from a scrap of paper, from a passing shape, from a spider's web."},
	       ])