class Quote < ActiveRecord::Base

	def self.motivation_quote
		quote = Quote.where(:title => CGI.unescapeHTML(TheySaidSo::quote_of_the_day)).first_or_create(
			:quote_types_id => 1
		)
		quote[:title]
	end

	def self.joke_quote
	  quote = Quote.where(:title => CGI.unescapeHTML(Icndb::random_joke)).first_or_create(
		  :quote_types_id => 2
	  )
	  quote[:title]
	end

  def self.fact_about_you
    quote = Quote.where(:title => CGI.unescapeHTML(Icndb::fact_about_you($user.first_name, $user.last_name))).first_or_create(
      :quote_types_id => 2
    )
	  quote[:title]
  end

	def self.motivation_russian_quote
		quote = Quote.where(:title => CGI.unescapeHTML(Forismatic::quote_of_the_day)).first_or_create(
			:quote_types_id => 1
		)
		quote[:title]
	end

	def self.random_quote
		Quote.order("RANDOM()").pluck(:title).first
	end

end
