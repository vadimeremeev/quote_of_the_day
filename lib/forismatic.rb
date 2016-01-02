class Forismatic

  def self.quote_of_the_day
    begin
      quote = RestClient.get("http://api.forismatic.com/api/1.0/?method=getQuote&format=text", :content_type => :json)
    rescue => e
      Rails.logger.error("Error happened #{e}")
    end
    quote.to_s
  end

end